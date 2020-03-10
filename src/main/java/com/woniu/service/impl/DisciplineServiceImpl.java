package com.woniu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.DisciplineDao;
import com.woniu.service.DisciplineService;
@Service
@Transactional
public class DisciplineServiceImpl implements DisciplineService {

	@Autowired
	DisciplineDao disciplineDao;
}
