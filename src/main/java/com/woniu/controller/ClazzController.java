package com.woniu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.pojo.Clazz;
import com.woniu.pojo.Emp;
import com.woniu.pojo.Message;
import com.woniu.pojo.PageBean;
import com.woniu.service.ClazzService;
import com.woniu.service.EmpService;

@Controller
@RequestMapping("clazz")
public class ClazzController {
	@Autowired
	ClazzService clazzService;
	@Autowired
	EmpService empService;

	@RequestMapping("index")
	public Object index(Model model, PageBean<Clazz> pageBean) {
		List<Clazz> classList = clazzService.selectByPage(pageBean);
		pageBean.setList(classList);
		pageBean.setPageRow(pageBean.getPageRow());
		int countRow = clazzService.countAll(pageBean);
		pageBean.setCountRow(countRow);
		int countPage = pageBean.getCountRow() % pageBean.getPageRow() == 0
				? pageBean.getCountRow() / pageBean.getPageRow()
				: pageBean.getCountRow() / pageBean.getPageRow() + 1;
		pageBean.setCountPage(countPage);
		model.addAttribute("pageBean", pageBean);
		return "clazz/index";
	}

	@RequestMapping("save")
	public String save(Model model) {
		List<Emp> empListByRole = empService.findAllByRole();
		model.addAttribute("empListByRole", empListByRole);
		return "clazz/save";
	}

	@ResponseBody
	@RequestMapping("saveClazz")
	public Object saveUser(Clazz clazz) {
		Message message = new Message();
		try {
			clazzService.save(clazz);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@RequestMapping("update")
	public String findOne(Integer cid, Model model) {
		Clazz clazz = clazzService.findOne(cid);
		model.addAttribute("clazz", clazz);
		return "clazz/update";
	}

	@ResponseBody
	@RequestMapping("updateClazz")
	public Object updateUser(Clazz clazz) {
		Message message = new Message();
		try {
			clazzService.update(clazz);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@ResponseBody
	@RequestMapping("delete")
	public Object delete(Integer cid) {
		Message message = new Message();
		try {
			clazzService.delete(cid);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

}
