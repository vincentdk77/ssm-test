package com.sitech.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sitech.bean.Department;
import com.sitech.bean.Employee;
import com.sitech.bean.EmployeeExample;
import com.sitech.bean.EmployeeExample.Criteria;
import com.sitech.service.DeptService;
import com.sitech.service.EmpSerive;

@Controller
public class EmpController {
	@Autowired
	private EmpSerive empService;
	@Autowired
	private DeptService deptService;
	
	/**
	 * 获取主页面员工数据
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	@ResponseBody
	public PageInfo getAll(@RequestParam(value="pageNo" ,defaultValue="1") int pageNo){
		PageHelper.startPage(pageNo, 5);
		List<Employee> list = new ArrayList<Employee>();
		list = empService.getAll();
		//连续显示几页
		PageInfo<List<Employee>> pageInfo = new PageInfo(list,5);
		System.out.println("查询成功！当前页面"+pageNo);
		return pageInfo;
	}
	
	/**
	 * 获取部门的下拉框数据
	 * @return
	 */
	@RequestMapping(value="/dept",method=RequestMethod.GET)
	@ResponseBody
	public List<Department> getDepartments(){
//		SELECT DISTINCT dept_name FROM tbl_dept;
		return deptService.findAllDeptNames();
	}
	
	/**
	 * 新增员工信息
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public int save(Employee employee) {
		System.err.println(employee);
		return empService.save(employee);
	}
	
	/**
	 * 根据员工id查询员工信息
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.GET)
	@ResponseBody
	public Employee getEmp(@PathVariable(value="empId") Integer empId){
		System.err.println("empId="+empId);
		return empService.selectByPrimaryKeyWithDept(empId);
	}
	/**
	 * 员工信息更新
	 */
	@RequestMapping(value="/emp",method=RequestMethod.PUT)
	@ResponseBody
	public int updateByPrimaryKey(Employee employee) {
		System.err.println(employee);
		return empService.updateByPrimaryKey(employee);
	}
	/**
	 * 单个删除、批量删除功能
	 */
	@RequestMapping(value="/emp",method=RequestMethod.DELETE)
	@ResponseBody
	public int deleteByPrimaryKey(String empId) {
		int count=0;
		System.err.println("empId=="+empId);
		String[] idArr = empId.split("-");
		List<Integer> list = new ArrayList<>();
		if(idArr.length>1) {
			for(String id:idArr) {
				list.add(Integer.parseInt(id));
			}
			EmployeeExample ee = new EmployeeExample();
			ee.createCriteria().andEmpIdIn(list);
			count = empService.deleteBatch(ee);
		}else if(idArr.length ==1) {
			count = empService.deleteByPrimaryKey(Integer.parseInt(empId));
		}
		return count;
	}
}
