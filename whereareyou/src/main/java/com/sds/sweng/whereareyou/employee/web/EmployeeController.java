package com.sds.sweng.whereareyou.employee.web;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.sds.sweng.whereareyou.domain.Employee;
import com.sds.sweng.whereareyou.employee.service.EmployeeService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

@Controller("foundationEmployeeController")
@RequestMapping("/employee.do")
@SessionAttributes(types = Employee.class)
public class EmployeeController {

	@Inject
	@Named("foundationEmployeeService")
	private EmployeeService employeeService;

	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Employee());
		return "foundationViewEmployee";
	}

	@RequestMapping(params = "method=create")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile,
			@Valid Employee employee, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		this.employeeService.create(employee);
		status.setComplete();
		
		return "redirect:/employeeFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("empId") String empId, Model model)
			throws Exception {
		Employee employee = this.employeeService.get(empId);
		if (employee == null) {
			throw new Exception("Resource not found " + empId);
		}
		model.addAttribute(employee);

		return "foundationViewEmployee";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Employee employee, BindingResult results, SessionStatus status) throws Exception {
	/*	if (results.hasErrors()) {
			return "foundationViewEmployee";
		}
		*/
		this.employeeService.update(employee);
		status.setComplete();

		return "redirect:/employeeFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("empId") String empId)
			throws Exception {
		this.employeeService.remove(empId);
		return "redirect:/employeeFinder.do?method=list";
	}
}
