package com.sds.sweng.whereareyou.project.web;

import java.util.ArrayList;
import java.util.LinkedList;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import anyframe.common.Page;

import com.sds.sweng.whereareyou.domain.Employee;
import com.sds.sweng.whereareyou.domain.Map;
import com.sds.sweng.whereareyou.domain.Project;
import com.sds.sweng.whereareyou.employee.service.EmployeeService;
import com.sds.sweng.whereareyou.project.service.MapFinder;
import com.sds.sweng.whereareyou.project.service.MapService;
import com.sds.sweng.whereareyou.project.service.ProjectFinder;
import com.sds.sweng.whereareyou.project.service.ProjectService;

@Controller("ProjectController")
public class ProjectController {

	/* 프로젝트 페이지 컨트롤러
	 * *** 메인화면 *** (프로젝트)
	 */
	
	@Inject
	@Named("foundationProjectFinder")
	private ProjectFinder projectFinder;
	
	@Inject
	@Named("foundationProjectService")
	private ProjectService projectService;
	
	@Inject
	@Named("foundationEmployeeService")
	private EmployeeService employeeService;

	@Inject
	@Named("foundationMapFinder")
	private MapFinder mapFinder;
	
	@Inject
	@Named("foundationMapService")
	private MapService mapService;
	
	/* 지도 화면*/
	@RequestMapping(value ="/project.do", params = "method=mapView")
	public String projectMapView(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "prjPosX", defaultValue = "0") int prjPosX,
			@RequestParam(value = "prjPosY", defaultValue = "0") int prjPosY, 
			Map map, BindingResult result, Model model) throws Exception {
		
		Page resultPage = mapFinder.getPagingList(map, pageIndex);
		ArrayList<Map> projects = this.mapService.getAllMap(null);

		model.addAttribute("projects", projects);
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("prjPosX", prjPosX);
		model.addAttribute("prjPosY", prjPosY);
	
		return "projectMapView";
	}
	
	/* 맵 좌표 수정 업데이트 메소드 */
	
	@RequestMapping(value ="/project.do", params = "method=updatePoint")
	public String updatePoint(@Valid Map map, BindingResult results, 
			@RequestParam(value = "prjPosX") int prjPosX,
			@RequestParam(value = "prjPosY") int prjPosY, 
			SessionStatus status, Model model) throws Exception {
		
		this.mapService.update(map);
		status.setComplete();

		model.addAttribute("prjPosX", prjPosX);
		model.addAttribute("prjPosY", prjPosY);
		
		return "redirect:/project.do?method=mapView&prjPosX=" + prjPosX +"&prjPosY=" + prjPosY;
	}
	
	
	/* 프로젝트 조회 기능 */
	
	@RequestMapping(value = "/project.do", params = "method=list")
	public String projectPageView (
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Project project, BindingResult result, Model model) throws Exception {
		
		model.addAttribute("introduction", "이곳은 프로젝트 페이지 입니다.");
		model.addAttribute("team1", "최해민");
		model.addAttribute("team2", "박종찬");
		
		Page resultPage = projectFinder.getPagingList(project, pageIndex);

		model.addAttribute("project", project);
		model.addAttribute("projects", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		return "projectMainView";
	}
	
	/* 프로젝트명 입력 메소드 */
	@RequestMapping(value ="/project.do", params = "method=search")
	public String search(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Project project, BindingResult result, Model model) throws Exception {
		
		Page resultPage = projectFinder.getPagingList(project, pageIndex);

		model.addAttribute("project", project);
		model.addAttribute("projects", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
	
		return "PopupLayout";
	}
	
	/* 프로젝트명 입력 메소드  주소버전*/
	@RequestMapping(value ="/project.do", params = "method=searchmap")
	public String searchmap(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Project project, BindingResult result, Model model) throws Exception {
		
		Page resultPage = projectFinder.getPagingList(project, pageIndex);

		model.addAttribute("project", project);
		model.addAttribute("projects", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
	
		return "PopupMapLayout";
	}
	
	/* 프로젝트명 입력 메소드 */
	@RequestMapping(value ="/project.do", params = "method=searchAddress")
	public String searchAddress(Model model) throws Exception {
		return "searchAddress";
	}
	
	@RequestMapping(value ="/projectInfo.do", params = "method=createView")
	public String createView(Model model) throws Exception {
		ArrayList<Project> projectAllList = this.projectService.getAllProject(null);
		Project lastProject = projectAllList.get(projectAllList.size()-1);
		model.addAttribute("lastSeq", String.format("%05d" ,Integer.parseInt(lastProject.getPrjSeq())+1));
		model.addAttribute(new Project());
		return "projectInfoView";
	}
	
	@RequestMapping(value ="/projectInfo.do", params = "method=create")
	public String create(
			@Valid Project project, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		this.projectService.create(project);
		status.setComplete();
		return "redirect:/project.do?method=list";
	}
	
	/* 프로젝트 조회 메소드 */
	
	@RequestMapping(value ="/projectInfo.do", params = "method=get")
	public String get(@RequestParam("seq") String seq, Model model)
			throws Exception {
		Project project = this.projectService.get(seq);
		ArrayList<Employee> employeeAllList = this.employeeService.getAllEmployee(null);
		int empNum = employeeAllList.size();
		ArrayList<Employee> employees = new ArrayList();
		for(int i=0; i<empNum; i++) {
			Employee tempEmp = employeeAllList.get(i);
			if(tempEmp.getEmpPrjSeq().equals(seq))
				employees.add(tempEmp);
		}
		if (project == null) {
			throw new Exception("Resource not found " + seq);
		}
		model.addAttribute("employees", employees);
		model.addAttribute("project", project);

		return "projectInfoView";
	}
	
	/* 프로젝트 수정 메소드 */
	
	@RequestMapping(value ="/projectInfo.do", params = "method=update")
	public String update(@Valid Project project, BindingResult results, SessionStatus status) throws Exception {
		
		this.projectService.update(project);
		status.setComplete();

		return "redirect:/project.do?method=list";
	}
	
	/* 프로젝트 삭제 메소드 */
	
	@RequestMapping(value ="/projectInfo.do", params = "method=remove")
	public String remove(@RequestParam("prjSeq") String prjSeq)
			throws Exception {
		this.projectService.remove(prjSeq);
		return "redirect:/project.do?method=list";
	}

	/* 주소를 통해 좌표값 받아오는 메소드 */
	
	@RequestMapping(value ="/projectInfo.do", params = "method=getposition")
	public String getPosition()
			throws Exception {
		System.out.println("좌표값_컨트롤");
		return "redirect:/proxy.jsp";
	}
	
}
