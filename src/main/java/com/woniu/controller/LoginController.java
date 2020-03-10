package com.woniu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.pojo.Emp;
import com.woniu.pojo.Message;
import com.woniu.pojo.Student;
import com.woniu.service.EmpService;
import com.woniu.service.StudentService;

@Controller
public class LoginController {
	@Autowired
	EmpService empService;

	@Autowired
	StudentService studentService;

	@RequestMapping("login")
	public String login() {
		return "login";
	}

	@RequestMapping("main")
	public String main() {
		return "main";
	}

	@RequestMapping("loginout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}

	@ResponseBody
	@RequestMapping("studentloginin")
	public Object loginIn(Student stu, HttpSession session) {
		Message message = new Message();
		Student loginstu = studentService.login(stu);
		session.setAttribute("loginUser", loginstu);
		if (loginstu != null) {
			message.setFlag(true);
		} else {
			message.setFlag(false);
		}
		return message;
	}
	
	@ResponseBody
	@RequestMapping("emploginin")
	public Object loginIn(Emp emp, HttpSession session) {
		Message message = new Message();
		Emp loginemp = empService.login(emp);
		session.setAttribute("loginUser", loginemp);
		if (loginemp != null) {
			message.setFlag(true);
		} else {
			message.setFlag(false);
		}
		return message;
	}
}
