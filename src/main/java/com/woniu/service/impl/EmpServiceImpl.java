package com.woniu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.EmpDao;
import com.woniu.pojo.Emp;
import com.woniu.pojo.PageBean;
import com.woniu.service.EmpService;
@Service
@Transactional
public class EmpServiceImpl implements EmpService {
	@Autowired
	EmpDao  empDao;

	@Override
	public List<Emp> findAll() {
		// TODO Auto-generated method stub
		return empDao.findAll();
	}

	@Override
	public Emp login(Emp emp) {
		// TODO Auto-generated method stub
		return empDao.login(emp);
	}

	@Override
	public List<Emp> findAllByRole() {
		// TODO Auto-generated method stub
		return empDao.findAllByRole();
	}

	@Override
	public void delete(Integer eid) {
		// TODO Auto-generated method stub
		empDao.delete(eid);
	}

	@Override
	public void update(Emp emp) {
		// TODO Auto-generated method stub
		empDao.update(emp);
	}

	@Override
	public Emp findOne(Integer eid) {
		// TODO Auto-generated method stub
		return empDao.findOne(eid);
	}

	@Override
	public void save(Emp emp) {
		// TODO Auto-generated method stub
		empDao.save(emp);
	}

	@Override
	public List<Emp> selectByPage(PageBean<Emp> pageBean) {
		// TODO Auto-generated method stub
		return empDao.selectByPage(pageBean);
	}

	@Override
	public int countAll(PageBean<Emp> pageBean) {
		// TODO Auto-generated method stub
		return empDao.countAll(pageBean);
	}

	@Override
	public void usernamepasswordUpdate(Emp emp) {
		// TODO Auto-generated method stub
		empDao.usernamepasswordUpdate(emp);
	}

	@Override
	public void updateOne(Emp emp) {
		// TODO Auto-generated method stub
		empDao.updateOne(emp);
	}

	@Override
	public List<Emp> findAllByTeacher() {
		// TODO Auto-generated method stub
		return empDao.findAllByTeacher();
	}


}
