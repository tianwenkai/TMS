package com.woniu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.DisciplineDao;
import com.woniu.pojo.Discipline;
import com.woniu.pojo.PageBean;
import com.woniu.service.DisciplineService;
@Service
@Transactional
public class DisciplineServiceImpl implements DisciplineService {

	@Autowired
	DisciplineDao disciplineDao;

	@Override
	public List<Discipline> selectByPage(PageBean<Discipline> pageBean) {
		// TODO Auto-generated method stub
		return disciplineDao.selectByPage(pageBean);
	}

	@Override
	public int countAll(PageBean<Discipline> pageBean) {
		// TODO Auto-generated method stub
		return disciplineDao.countAll(pageBean);
	}

	@Override
	public Discipline findOne(Integer disid) {
		// TODO Auto-generated method stub
		return disciplineDao.findOne(disid);
	}

	@Override
	public void delete(Integer disid) {
		// TODO Auto-generated method stub
		disciplineDao.delete(disid);
	}

	@Override
	public void update(Discipline discipline) {
		// TODO Auto-generated method stub
		disciplineDao.update(discipline);
	}

	@Override
	public void save(Discipline discipline) {
		// TODO Auto-generated method stub
		disciplineDao.save(discipline);
	}

	@Override
	public List<Discipline> findAll() {
		// TODO Auto-generated method stub
		return disciplineDao.findAll();
	}
}
