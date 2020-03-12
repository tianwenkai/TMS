package com.woniu.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	// 登出
	@RequestMapping("loginout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}

	// 学生登陆
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

	// 员工登陆
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

	// 个人信息查询
	@ResponseBody
	@RequestMapping("information")
	public void loginIn(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if (session.getAttribute("loginUser") instanceof Student) {
			try {
				Student stu = (Student)session.getAttribute("loginUser");
				int sid = stu.getSid();
				response.sendRedirect(request.getServletContext().getContextPath() + "/student/information?sid="+sid);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				Emp emp = (Emp)session.getAttribute("loginUser");
				int eid = emp.getEid();
				response.sendRedirect(request.getServletContext().getContextPath() + "/emp/information?eid="+eid);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
