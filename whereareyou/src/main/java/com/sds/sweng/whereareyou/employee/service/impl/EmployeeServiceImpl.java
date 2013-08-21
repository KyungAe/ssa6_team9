package com.sds.sweng.whereareyou.employee.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;
import com.sds.sweng.whereareyou.domain.Employee;
import com.sds.sweng.whereareyou.employee.service.EmployeeService;

@Service("foundationEmployeeService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class EmployeeServiceImpl implements EmployeeService {

	IIdGenerationService idGenerationService;

	@Inject
	@Named("foundationEmployeeDao")
	private EmployeeDao employeeDao;

	public void create(Employee employee) throws Exception {
//		employee.setEmpId(idGenerationService.getNextIntegerId());
		employeeDao.create(employee);
	}

	public void remove(String empId) throws Exception {
		employeeDao.remove(empId);
	}

	public void update(Employee employee) throws Exception {
		employeeDao.update(employee);
	}

	public Employee get(String empId) throws Exception {
		return employeeDao.get(empId);
	}
	
	public ArrayList<Employee> getAllEmployee(Employee employee) throws Exception {
		return employeeDao.getAllEmployee(employee);
	}
}
