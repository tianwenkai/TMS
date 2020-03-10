package com.woniu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.StudentDao;
import com.woniu.pojo.Student;
import com.woniu.service.StudentService;
@Service
@Transactional
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentDao studentDao;

	@Override
	public Student login(Student stu) {
		// TODO Auto-generated method stub
		return studentDao.login(stu);
	}

}
