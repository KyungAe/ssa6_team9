package com.sds.sweng.whereareyou.employee.service;

import java.util.ArrayList;

import com.sds.sweng.whereareyou.domain.Employee;

public interface EmployeeService {

	Employee get(String empId) throws Exception;

	void create(Employee employee) throws Exception;

	void update(Employee employee) throws Exception;

	void remove(String empId) throws Exception;
	
	public ArrayList<Employee> getAllEmployee(Employee employee) throws Exception;

}
