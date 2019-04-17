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
	public int save(Employee employee) {
		// TODO Auto-generated method stub
		return employeeMapper.insert(employee);
	}
	public Employee selectByPrimaryKeyWithDept(Integer empId) {
		// TODO Auto-generated method stub
		return employeeMapper.selectByPrimaryKeyWithDept(empId);
	}
	public int updateByPrimaryKey(Employee employee) {
		// TODO Auto-generated method stub
		return employeeMapper.updateByPrimaryKey(employee);
	}

}
