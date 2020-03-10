package com.woniu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.pojo.Emp;
import com.woniu.service.EmpService;

@Controller
@RequestMapping("emp")
public class EmpController {
	@Autowired
	EmpService empService;

	@RequestMapping("index")
	public String list(Model model) {
		List<Emp> empList = empService.findAll();
		model.addAttribute("deptList", empList);
		return "index";
	}
}
