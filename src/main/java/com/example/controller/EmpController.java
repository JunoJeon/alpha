package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.DeptMapper;
import com.example.mapper.EmpMapper;
import com.example.model.Emp;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/emp")
public class EmpController {
	
	@Autowired
	EmpMapper empmapper;
	
	@Autowired
	DeptMapper deptmapper;
	
	@GetMapping("/list")
	void list(Integer deptno, String search, HttpServletRequest request) {
		
		var list = empmapper.selectBySearch(deptno, search);
		request.setAttribute("list", list);
		
		var depts = deptmapper.selectAll();
		request.setAttribute("depts", depts);
	}
	
	@GetMapping("/list2")
	void list2(Integer deptno, HttpServletRequest request) {
		
		List<Emp> list = null;
		if (deptno == null) 
			list = empmapper.selectAll();
		else
			list = empmapper.selectByDeptno(deptno);
		request.setAttribute("list", list);
		
		var depts = deptmapper.selectAll();
		request.setAttribute("depts", depts);
	}
	
	
//	@GetMapping("/list")
//	String list(HttpServletRequest request) {
//		String search = request.getParameter("search");
//		
//		var list = mapper.selectAll(search);
//		request.setAttribute("list", list);
//		
//		return "emp/list";
//	}
}
