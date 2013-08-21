package com.sds.sweng.whereareyou.employee.service;

import anyframe.common.Page;
import com.sds.sweng.whereareyou.domain.Employee;


public interface EmployeeFinder {
	Page getPagingList(Employee employee, int pageIndex) throws Exception;
}
