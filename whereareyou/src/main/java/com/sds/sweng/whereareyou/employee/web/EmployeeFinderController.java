package com.sds.sweng.whereareyou.employee.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import anyframe.common.Page;
import com.sds.sweng.whereareyou.domain.Employee;
import com.sds.sweng.whereareyou.employee.service.EmployeeFinder;

@Controller("foundationEmployeeFinderController")
@RequestMapping("/employeeFinder.do")
public class EmployeeFinderController {

	@Inject
	@Named("foundationEmployeeFinder")
	private EmployeeFinder employeeFinder;

	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Employee employee, BindingResult result, Model model) throws Exception {

		Page resultPage = employeeFinder.getPagingList(employee, pageIndex);

		model.addAttribute("employee", employee);
		model.addAttribute("employees", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);

		return "empTeamList";
	}
	
	@RequestMapping(params = "method=search")
	public String search(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Employee employee, BindingResult result, Model model) throws Exception {
		
		Page resultPage = employeeFinder.getPagingList(employee, pageIndex);

		model.addAttribute("employee", employee);
		model.addAttribute("employees", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
	
		return "EmpPopupLayout";
	}
}
