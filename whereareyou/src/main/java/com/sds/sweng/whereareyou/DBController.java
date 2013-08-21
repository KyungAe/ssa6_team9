package com.sds.sweng.whereareyou;

import org.apache.poi.xssf.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.sds.sweng.whereareyou.domain.Employee;
import com.sds.sweng.whereareyou.domain.Project;
import com.sds.sweng.whereareyou.employee.service.EmployeeService;
import com.sds.sweng.whereareyou.project.service.ProjectService;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Random;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;

@Controller("DBController")
public class DBController {


	/* 엑셀-DB 컨트롤러
	 * 
	 *  엑셀파일을 불러들여서 자동으로 DB에 반영하는 시스템이다.
	 */

	@Inject
	@Named("foundationProjectService")
	private ProjectService projectService;
	
	@Inject
	@Named("foundationEmployeeService")
	private EmployeeService employeeService;


	// IMPORT TO EXCEL 메인페이지를 표현하는 메소드 (엄청 심플하지?)
	@RequestMapping(value = "/xlsImport.do", params = "method=init")
	public String exectToDB (Model model) {
		return "xlsImportMainView";
	}

	// 프로젝트를 DB에 입력하는 메소드
	@RequestMapping(value = "/xlsImport.do", params = "method=importExcelFile")
	public String xlsImportToProject (
			@RequestParam(value = "excelFile", required = false) MultipartFile excelFile,
			Model model, SessionStatus status, HttpSession session) throws Exception {

		// 엑셀파일을 읽는데 필요한 변수들
		String [][] employeeData = null;
		String [][] projectData = null;


		try {

			if (excelFile != null && !excelFile.getOriginalFilename().equals("")) {

				
				/* 서버에 임시로 파일을 올리는 작업을 시작한다 */
				String excelName = excelFile.getOriginalFilename();
				String destDir = session.getServletContext().getRealPath("/xls_temp/");
				
				File dirPath = new File(destDir);

				if (!dirPath.exists()) {
					boolean created = dirPath.mkdirs();
					if (!created) {
						throw new Exception(
								"Fail to create a directory for importing Excel File. [" + destDir + "]");
					}
				}

				File destination = File.createTempFile("file", excelName, dirPath);
				FileCopyUtils.copy(excelFile.getInputStream(),
						new FileOutputStream(destination));

				status.setComplete();
				/* 서버에 임시파일 올리기 끝 */
				
				
				/* 서버에 올린 임시파일에서 엑셀파일 로딩 */
				XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(destination));
				XSSFSheet sheet = null;
				XSSFRow row = null;
				XSSFCell cell = null;
				/* 엑셀파일 로딩 끝 */
				
				
				/* 기존의 데이터베이스 초기화 작업 */
				
				// 프로젝트와 사원의 정보를 모두 불러온다.
				ArrayList<Project> projectAllList = this.projectService.getAllProject(null);
				ArrayList<Employee> employeeAllList = this.employeeService.getAllEmployee(null);
				
				
				int projectNum = projectAllList.size();
				int employeeNum = employeeAllList.size();
				
				for(int i=0; i<employeeNum; i++) {
					Employee tempEmployee = employeeAllList.get(i);
					this.employeeService.remove(tempEmployee.getEmpId());
				}
				employeeAllList.clear();
				
				for(int i=0; i<projectNum; i++) {
					Project tempProject = projectAllList.get(i);
					this.projectService.remove(tempProject.getPrjSeq());
				}
				projectAllList.clear();
				
				/* 데이터베이스 초기화 작업 끝 */
				
				
				/* ***********************************/
				/* 첫번째 시트 파싱 작업 (사원 시트) */

				int employeeRowCount = 0;
				int employeeCellCount = 0;
				
				sheet = workbook.getSheetAt(0);
				employeeRowCount = sheet.getPhysicalNumberOfRows();
				//cellCount = sheet.getRow(0).getPhysicalNumberOfCells();
				employeeCellCount = 10; // 10번째 칼럼까지 일단 받는다.

				employeeData = new String [employeeRowCount][employeeCellCount];

				for(int i=2; i<employeeRowCount; i++) {
					row = sheet.getRow(i);

					for(int j=0; j<employeeCellCount; j++) {
						cell = row.getCell(j);
						String tempData = "";
						
						// 셀의 타입에 따라서 적절하게 파싱
						if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
							tempData = Double.toString(cell.getNumericCellValue());
						
						else if(cell.getCellType() == XSSFCell.CELL_TYPE_FORMULA)
							tempData = cell.getCellFormula();
						
						else
							tempData = cell.getStringCellValue();

						employeeData[i][j] = tempData;
					}
				}
				
				/* **********************************/
				/* 두번째 시트 파싱 작업 (프로젝트) */

				int projectRowCount = 0;
				int projectCellCount = 0;
				
				sheet = workbook.getSheetAt(1);
				projectRowCount = sheet.getPhysicalNumberOfRows();
				//cellCount = sheet.getRow(0).getPhysicalNumberOfCells();
				projectCellCount = 7; // 7번째 셀까지 받는다.

				projectData = new String [projectRowCount][projectCellCount];

				for(int i=2; i<projectRowCount; i++) {
					row = sheet.getRow(i);

					for(int j=0; j<projectCellCount-1; j++) {
						cell = row.getCell(j);
						String tempData = "";
						
						// 셀의 타입에 따라서 적절하게 파싱
						if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
							tempData = Double.toString(cell.getNumericCellValue());
						
						else if(cell.getCellType() == XSSFCell.CELL_TYPE_FORMULA)
							tempData = cell.getCellFormula();
						
						else
							tempData = cell.getStringCellValue();

						projectData[i][j] = tempData;
					}
				}
				
				/* *************************/
				/* 프로젝트 DB에 반영 시작 */
				
				/* 먼저 DUMMY 프로젝트를 등록 (프로젝트 시퀀스 '00000') */
				Project nullProject = new Project();
				nullProject.setPrjSeq("00000");
				nullProject.setPrjNm("진행중인 프로젝트 없음");
				nullProject.setPrjAddr("");
				nullProject.setPrjRepIdEmpId("00000");
				nullProject.setPrjPosX(0);
				nullProject.setPrjPosY(0);
				
				this.projectService.create(nullProject);

				// 한 행씩 읽어들여서 자동으로 해당 컬럼에 파싱한다.
				for (int i=2; i< projectRowCount; i++) {

					Project project = new Project();
					String seq = Integer.toString(i-1);
					int seqLength = seq.length();
					
					Random genPos = new Random();
					// 시퀀스를 만드는 작업 (자릿수를 다섯자리로 맞춘다)
					for(int j=0; j<5-seqLength; j++)
						seq = "0" + seq;
					
					projectData[i][6] = seq;
					project.setPrjSeq(seq);
					project.setPrjNm(projectData[i][0]);
					project.setPrjAddr(projectData[i][5]);
					project.setPrjRepIdEmpId(findEmpIdInEmployeeTable(employeeData, projectData[i][3]));
					
					int ranPosX = genPos.nextInt(35500) + 286500;
					int ranPosY = genPos.nextInt(19400) + 540100;
					project.setPrjPosX(ranPosX);
					project.setPrjPosY(ranPosY);

					this.projectService.create(project); // Project 객체 생성하여 DB로 보냄
				}
				
				/* *********************/
				/* 사원 DB에 반영 시작 */

				for (int i=2; i< employeeRowCount; i++) {

					Employee employee = new Employee();
					employee.setEmpId(employeeData[i][4].substring(0,5)); //사번
					employee.setEmpNm(employeeData[i][2]); //사원이름
					
					String tempEmpEntSeq = employeeData[i][5];
					
					if(tempEmpEntSeq.contains("."))
						tempEmpEntSeq = tempEmpEntSeq.substring(0,2);
					
					employee.setEmpEntSeq(tempEmpEntSeq); //기수
					employee.setEmpDeptNm(employeeData[i][1]); //부서명
					//employee.setEmpSendCode(employeeData[i][3]);
					employee.setEmpSendCode("0"); //파견코드 (0으로 초기화 : 사용자가 직접 수정)
					
					String prjSeq = findSeqInProjectTable(projectData, employeeData[i][8]);
					employee.setEmpPrjSeq(prjSeq);

					this.employeeService.create(employee); // Project 객체 생성하여 DB로 보냄
				}
				this.projectService.remove("00000");

			}	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		// 프로젝트와 사원의 정보를 모두 불러온다.
		ArrayList<Project> projects = this.projectService.getAllProject(null);
		int prjNum = projects.size();
		model.addAttribute("projects", projects);
		model.addAttribute("prjNum", prjNum);
		model.addAttribute("successCategory", "사원과 프로젝트");
		
		return "addrMappingView";
	}
	
	/* 프로젝트 데이터에서 프로젝트 SEQ를 받아오는 메소드
	 * employee 테이블에 등록할 때 필요하다.
	 * */
	public String findSeqInProjectTable (String [][] table, String prjNm) {
		
		int tableLength = table.length;
		for (int i=2; i<tableLength; i++) {
			
			if (table[i][0].contains(prjNm) || table[i][0].equals(prjNm))
				return table[i][6];
		}
		return "00000"; //찾지 못할 경우 1번 프로젝트로 반환한다.

	}
	/* 사원 데이터에서 사번을 받아오는 메소드
	 * 프로젝트 테이블에 등록할 때 필요하다.
	 */
	public String findEmpIdInEmployeeTable (String [][] table, String empNm) {
		
		int tableLength = table.length;
		for (int i=2; i<tableLength; i++) {
			
			if (table[i][2].equals(empNm))
				return table[i][4].substring(0,5);
		}
		return ""; //찾지 못할 경우 사번을 00000 으로 등록한다.

	}
	
	/* DB의 주소 정보를 통해 X, Y 좌표를 매핑하는 메소드
	 * 
	 */
	
	// 프로젝트를 DB에 입력하는 메소드
	@RequestMapping(value = "/xlsImport.do", params = "method=addrMappingToDB")
	public String addrMappingToDB (
			@RequestParam(value = "xPosArray[]") String [] xPosArray,
			@RequestParam(value = "yPosArray[]") String [] yPosArray,
			@RequestParam(value = "seqArray[]") String [] seqArray, 
			Model model, SessionStatus status, HttpSession session) throws Exception {
		
		ArrayList<Project> projectAllList = this.projectService.getAllProject(null);
		int projectNum = projectAllList.size();
		
		for(int i=0; i<projectNum; i++) {
			String seq = seqArray[i];
			int seqLength = seqArray[i].length();
			for(int j=0; j<5-seqLength; j++)
				seq = "0" + seq;
			Project updateProject = this.projectService.get(seq);
			updateProject.setPrjPosY(Integer.parseInt(xPosArray[i]));
			updateProject.setPrjPosX(Integer.parseInt(yPosArray[i]));
			this.projectService.update(updateProject);
		}
		projectAllList.clear();
		
		model.addAttribute("successCategory", "사원과 프로젝트");
		
		return "xlsImportMainView";	
		
	}

}
