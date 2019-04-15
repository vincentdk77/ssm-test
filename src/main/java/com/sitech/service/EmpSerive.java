package com.sitech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sitech.bean.Employee;
import com.sitech.dao.EmployeeMapper;

@Service
public class EmpSerive {
	@Autowired
	EmployeeMapper employeeMapper;
	public List<Employee> getAll() {
		
		return employeeMapper.selectByExampleWithDept(null);
	}

}
