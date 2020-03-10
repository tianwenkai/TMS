package com.woniu.service;

import java.util.List;

import com.woniu.pojo.Clazz;
import com.woniu.pojo.PageBean;

public interface ClazzService {

	List<Clazz> findAll();

	void save(Clazz clazz);

	Clazz findOne(Integer cid);

	void update(Clazz clazz);

	void delete(Integer cid);

	List<Clazz> selectByPage(PageBean<Clazz> pageBean);

	int countAll(PageBean<Clazz> pageBean);

}
