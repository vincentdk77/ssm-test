package com.sitech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sitech.bean.Department;
import com.sitech.dao.DepartmentMapper;

@Service
public class DeptService {
	@Autowired
	private DepartmentMapper departmentMapper;
	public List<Department> findAllDeptNames() {
//		return departmentMapper.selectDeptNameByExample(null);
		return departmentMapper.selectByExample(null);
	}
	
}
