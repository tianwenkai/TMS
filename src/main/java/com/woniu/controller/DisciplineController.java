package com.woniu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.pojo.Discipline;
import com.woniu.pojo.Message;
import com.woniu.pojo.PageBean;
import com.woniu.service.DisciplineService;

@Controller
@RequestMapping("discipline")
public class DisciplineController {
	@Autowired
	DisciplineService disciplineService;
	
	@RequestMapping("index")
	public String index(Model model, PageBean<Discipline> pageBean) {
		List<Discipline> disList = disciplineService.selectByPage(pageBean);
		pageBean.setList(disList);
		pageBean.setPageRow(pageBean.getPageRow());
		int countRow = disciplineService.countAll(pageBean);
		pageBean.setCountRow(countRow);
		int countPage = pageBean.getCountRow() % pageBean.getPageRow() == 0
				? pageBean.getCountRow() / pageBean.getPageRow()
				: pageBean.getCountRow() / pageBean.getPageRow() + 1;
		pageBean.setCountPage(countPage);
		model.addAttribute("pageBean", pageBean);
		return "discipline/index";
	}
	
	@RequestMapping("save")
	public String save() {
		return "discipline/save";
	}

	@ResponseBody
	@RequestMapping("saveDiscipline")
	public Object saveUser(Discipline discipline) {
		Message message = new Message();
		try {
			disciplineService.save(discipline);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@RequestMapping("update")
	public String findOne(Integer disid, Model model) {
		Discipline discipline = disciplineService.findOne(disid);
		model.addAttribute("discipline", discipline);
		return "discipline/update";
	}

	@ResponseBody
	@RequestMapping("updateDiscipline")
	public Object updateUser(Discipline discipline) {
		Message message = new Message();
		try {
			disciplineService.update(discipline);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@ResponseBody
	@RequestMapping("delete")
	public Object delete(Integer disid) {
		Message message = new Message();
		try {
			disciplineService.delete(disid);
			message.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	
}
