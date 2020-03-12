package com.woniu.dao;

import java.util.List;

import com.woniu.pojo.Emp;
import com.woniu.pojo.PageBean;

public interface EmpDao {

	List<Emp> findAll();

	Emp login(Emp emp);

	List<Emp> findAllByRole();

	void delete(Integer eid);

	void update(Emp emp);

	void save(Emp emp);

	List<Emp> selectByPage(PageBean<Emp> pageBean);

	int countAll(PageBean<Emp> pageBean);

	Emp findOne(Integer eid);

	void usernamepasswordUpdate(Emp emp);

	void updateOne(Emp emp);

	List<Emp> findAllByTeacher();

}
