package com.woniu.dao;

import java.util.List;

import com.woniu.pojo.Clazz;
import com.woniu.pojo.PageBean;

public interface ClazzDao {

	List<Clazz> findAll();

	void save(Clazz clazz);

	Clazz findOne(Integer cid);

	void update(Clazz clazz);

	void delete(Integer cid);

	int countAll();

	List<Clazz> selectByPage(PageBean<Clazz> pageBean);

}
