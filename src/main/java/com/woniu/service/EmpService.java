package com.woniu.service;

import java.util.List;

import com.woniu.pojo.Emp;
import com.woniu.pojo.PageBean;

public interface EmpService {

	List<Emp> findAll();

	Emp login(Emp emp);

	List<Emp> findAllByRole();

	void delete(Integer eid);

	void update(Emp emp);

	Emp findOne(Integer eid);

	void save(Emp emp);

	List<Emp> selectByPage(PageBean<Emp> pageBean);

	int countAll(PageBean<Emp> pageBean);

	void usernamepasswordUpdate(Emp emp);

	void updateOne(Emp emp);

	List<Emp> findAllByTeacher();

}
