package com.woniu.service;

import java.util.List;

import com.woniu.pojo.Discipline;
import com.woniu.pojo.PageBean;

public interface DisciplineService {

	List<Discipline> selectByPage(PageBean<Discipline> pageBean);

	int countAll(PageBean<Discipline> pageBean);

	Discipline findOne(Integer disid);

	void delete(Integer disid);

	void update(Discipline discipline);

	void save(Discipline discipline);

	List<Discipline> findAll();


}
