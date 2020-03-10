package com.woniu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.ClazzDao;
import com.woniu.pojo.Clazz;
import com.woniu.pojo.PageBean;
import com.woniu.service.ClazzService;

@Service
@Transactional
public class ClazzServiceImpl implements ClazzService {
	@Autowired
	ClazzDao clazzDao;

	@Override
	public List<Clazz> findAll() {
		// TODO Auto-generated method stub
		return clazzDao.findAll();
	}

	@Override
	public void save(Clazz clazz) {
		// TODO Auto-generated method stub
		clazzDao.save(clazz);
	}

	@Override
	public Clazz findOne(Integer cid) {
		// TODO Auto-generated method stub
		return clazzDao.findOne(cid);
	}

	@Override
	public void update(Clazz clazz) {
		// TODO Auto-generated method stub
		clazzDao.update(clazz);
	}

	@Override
	public void delete(Integer cid) {
		// TODO Auto-generated method stub
		clazzDao.delete(cid);
	}

	@Override
	public List<Clazz> selectByPage(PageBean<Clazz> pageBean) {
		// TODO Auto-generated method stub
		return clazzDao.selectByPage(pageBean);
	}

	@Override
	public int countAll(PageBean<Clazz> pageBean) {
		// TODO Auto-generated method stub
		return clazzDao.countAll();
	}
	
}
