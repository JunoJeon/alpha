package com.example.controller;

import java.util.List;

import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.CityMapper;
import com.example.model.City;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/city")
public class CityController {
	
	@Autowired
	CityMapper mapper;	
	
//	static Logger log = LoggerFactory.getLogger(CityController.class);
	@GetMapping("/list")
	String list(String code, Model model) { // IoC (Inversr Of Control - 제어의 역전
		System.out.println("list");
		
		List<City> list = null;
		if(code==null || code.trim().equals(""))
			list = mapper.selectAll();
		else
			list = mapper.selectAllByCode(code);
		
		model.addAttribute("list", list);
		
		var codes = mapper.selectConutryCodes();
		model.addAttribute("codes", codes);
		
		return "/city/list";
	}
}
