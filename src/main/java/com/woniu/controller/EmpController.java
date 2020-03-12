package com.woniu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.pojo.Emp;
import com.woniu.pojo.Message;
import com.woniu.pojo.PageBean;
import com.woniu.service.EmpService;

@Controller
@RequestMapping("emp")
public class EmpController {
	@Autowired
	EmpService empService;

	@RequestMapping("index")
	public String index(Model model, PageBean<Emp> pageBean) {
		List<Emp> empList = empService.selectByPage(pageBean);
		pageBean.setList(empList);
		pageBean.setPageRow(pageBean.getPageRow());
		int countRow = empService.countAll(pageBean);
		pageBean.setCountRow(countRow);
		int countPage = pageBean.getCountRow() % pageBean.getPageRow() == 0
				? pageBean.getCountRow() / pageBean.getPageRow()
				: pageBean.getCountRow() / pageBean.getPageRow() + 1;
		pageBean.setCountPage(countPage);
		model.addAttribute("pageBean", pageBean);
		return "emp/index";
	}

	@RequestMapping("save")
	public String save() {
		return "emp/save";
	}

	@ResponseBody
	@RequestMapping("saveEmp")
	public Object saveUser(Emp emp) {
		Message message = new Message();
		try {
			emp.setUpwd("123");
			empService.save(emp);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@RequestMapping("update")
	public String findOne(Integer eid, Model model) {
		Emp emp = empService.findOne(eid);
		model.addAttribute("emp", emp);
		return "emp/update";
	}

	@ResponseBody
	@RequestMapping("updateEmp")
	public Object updateUser(Emp emp) {
		Message message = new Message();
		try {
			empService.update(emp);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@ResponseBody
	@RequestMapping("delete")
	public Object delete(Integer eid) {
		Message message = new Message();
		try {
			empService.delete(eid);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@ResponseBody
	@RequestMapping("resetUpwd")
	public Object resetUpwd(Integer eid) {
		Message message = new Message();
		try {
			Emp emp = empService.findOne(eid);
			emp.setUpwd("000");
			empService.update(emp);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@RequestMapping("information")
	public String index(Model model, HttpSession session) {
		Emp emp = (Emp) session.getAttribute("loginUser");
		emp = empService.findOne(emp.getEid());
		model.addAttribute("emp", emp);
		return "empinformation";
	}

	@RequestMapping("updateByOne")
	public String updateByOne(Model model,Integer eid) {
		Emp emp = empService.findOne(eid);
		model.addAttribute("emp", emp);
		return "emp/updateByOne";
	}
    @ResponseBody
    @RequestMapping("updateOne")
    public Object updateOne(Emp emp){
        Message message = new Message();
        try {
        	empService.updateOne(emp);
            message.setFlag(true);
        } catch (Exception e) {
            e.printStackTrace();
            message.setFlag(false);
        }
        return message;
    }

	@RequestMapping("usernamepassword")
	public String usernamepassword(Model model) {
		return "emp/usernamepassword";
	}
    @ResponseBody
    @RequestMapping("usernamepasswordUpdate")
    public Object usernamepasswordUpdate(Emp emp){
        Message message = new Message();
        try {
            empService.usernamepasswordUpdate(emp);
            message.setFlag(true);
        } catch (Exception e) {
            e.printStackTrace();
            message.setFlag(false);
        }
        return message;
    }
	
	

   
}
