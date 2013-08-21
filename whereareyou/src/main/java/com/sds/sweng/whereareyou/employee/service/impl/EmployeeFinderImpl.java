package com.sds.sweng.whereareyou.employee.service.impl;


import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.sds.sweng.whereareyou.domain.Employee;
import com.sds.sweng.whereareyou.employee.service.EmployeeFinder;
import anyframe.common.Page;

@Service("foundationEmployeeFinder")
public class EmployeeFinderImpl implements EmployeeFinder {
	
	@Inject
	@Named("foundationEmployeeDao")
	private EmployeeDao employeeDao;

	public Page getPagingList(Employee employee, int pageIndex) throws Exception {
		return this.employeeDao.getPagingList(employee, pageIndex);
	}
}
