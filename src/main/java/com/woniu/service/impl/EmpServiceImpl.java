package com.woniu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.EmpDao;
import com.woniu.pojo.Emp;
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

}
