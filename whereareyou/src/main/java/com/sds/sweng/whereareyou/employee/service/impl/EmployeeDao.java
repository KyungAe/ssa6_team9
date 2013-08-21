package com.sds.sweng.whereareyou.employee.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;
import com.sds.sweng.whereareyou.domain.Employee;


@Repository("foundationEmployeeDao")
public class EmployeeDao extends AbstractDAO {
	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(Employee employee) throws Exception {
		create("Employee", employee);
	}

	public void remove(String empId) throws Exception {
		Employee employee = new Employee();
		employee.setEmpId(empId);
		remove("Employee", employee);
	}

	public void update(Employee employee) throws Exception {
		update("Employee", employee);
	}

	public Employee get(String empId) throws Exception {
		Employee employee = new Employee();
		employee.setEmpId(empId);
		return (Employee) findByPk("Employee", employee);
	}

	public Page getPagingList(Employee employee, int pageIndex) throws Exception {
		return this.findListWithPaging("Employee", employee, pageIndex, pageSize,
				pageUnit);
	}
	
	public ArrayList<Employee> getAllEmployee(Employee employee) throws Exception {
		this.setFindListPostfix("AllList");
		@SuppressWarnings("unchecked")
		ArrayList<Employee> result = (ArrayList<Employee>) this.findList("Employee", employee);
		this.setFindListPostfix("List");
		return result;
	}
}
