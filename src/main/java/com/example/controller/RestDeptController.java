package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.DeptMapper;
import com.example.model.Dept;

@Controller
@RequestMapping("/rest/dept")		//rest를 쓸때 가장 잘쓰는방식은 GET, POST, PUT, DELETE이다.
public class RestDeptController {
	
	@Autowired
	DeptMapper mapper;
	
	@GetMapping(headers = {"Accept=text/html"}) //GET은 두개가 중복될수없다. 그래서 Accept text/html을 줘서 주소로 접속시 뷰를 호출하게 만든다.
	void view() {
		
	}
	
	@GetMapping
	@ResponseBody
	ResponseEntity<Object> get() {
		
		var list = mapper.selectAll();
		var body = new HashMap<String, Object>();
		body.put("result", "success");
		body.put("data", list);
		
		return new ResponseEntity<Object>(body, HttpStatus.OK);
	}
	
	@PostMapping
	@ResponseBody
	ResponseEntity<Object> post(@RequestBody Dept dept) {
		System.out.println("post()...");
		System.out.println(dept);
		
		ResponseEntity<Object> response = null;
		var body = new HashMap<String, Object>();

		try {
			mapper.insert(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);
		} catch (DuplicateKeyException e) {
			body.put("result", "error");
			body.put("message", "존재하는 부서입니다.");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		} catch (Exception e) {
			body.put("result", "error");
			body.put("message", e.getMessage());
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return response;
	}
	
	@PutMapping
	@ResponseBody
	ResponseEntity<Object> put(@RequestBody Dept dept) { //update
		ResponseEntity<Object> response = null;
		var body = new HashMap<String, Object>();
		
		try {
			mapper.update(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);
		} catch (DuplicateKeyException e) {
			body.put("result", "error");
			body.put("message", e.getMessage());
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return response;
	}
	
	@DeleteMapping
	@ResponseBody
	ResponseEntity<Object> delete(@RequestBody Dept dept) { //update
		ResponseEntity<Object> response = null;
		var body = new HashMap<String, Object>();
		
		try {
			mapper.delete(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);
		} catch (DuplicateKeyException e) {
			body.put("result", "error");
			body.put("message", "사원이 소속된 부서는 삭제할 수 없습니다.");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		} catch (Exception e) {
			e.printStackTrace();
			body.put("result", "error");
			body.put("message", e.getClass());
			body.put("message", e.getMessage());
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return response;
	}
}
