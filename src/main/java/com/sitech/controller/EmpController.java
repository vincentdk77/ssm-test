package com.sitech.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sitech.bean.Employee;
import com.sitech.service.EmpSerive;

@Controller
public class EmpController {
	@Autowired
	private EmpSerive empService;
	
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	@ResponseBody
	public PageInfo getAll(@RequestParam(value="pageNo" ,defaultValue="1") int pageNo){
		PageHelper.startPage(pageNo, 5);
		List<Employee> list = new ArrayList<Employee>();
		list = empService.getAll();
		PageInfo<List<Employee>> pageInfo = new PageInfo(list,5);
		System.out.println("查询成功！当前页面"+pageNo);
		return pageInfo;
	}
}
