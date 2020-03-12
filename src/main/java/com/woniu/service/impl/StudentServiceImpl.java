package com.woniu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.StudentDao;
import com.woniu.pojo.PageBean;
import com.woniu.pojo.Student;
import com.woniu.service.StudentService;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDao;

    @Override
    public List<Student> findAll() {
        return studentDao.findAll();
    }

    @Override
    public Student login(Student student) {
        return studentDao.login(student);
    }

    @Override
    public List<Student> findAllByPageAndClazzId(Map<String, Object> map) {
        return studentDao.findAllByPageAndClazzId(map);
    }

    @Override
    public int countAllByPageAndClazzId(Map<String, Object> map) {
        return studentDao.countAllByPageAndClazzId(map);
    }

    @Override
    public void save(Student student) {
        studentDao.save(student);
    }

    @Override
    public Student findOneByStudentId(Integer sid) {
        return studentDao.findOneByStudentId(sid);
    }

    @Override
    public void update(Student student) {
        studentDao.update(student);
    }

    @Override
    public List<Student> findAllByPage(PageBean<Student> pageBean) {
        return studentDao.findAllByPage(pageBean);
    }

    @Override
    public int countAllByPage(PageBean<Student> pageBean) {
        return studentDao.countAllByPage(pageBean);
    }

    @Override
    public void delete(Integer id) {
        studentDao.delete(id);
    }

    @Override
    public void deleteByIds(Integer[] ids) {
        studentDao.deleteByIds(ids);
    }

    @Override
    public void usernamepasswordUpdate(Student student) {
        studentDao.usernamepasswordUpdate(student);
    }

    @Override
    public void updateOne(Student student) {
        studentDao.updateOne(student);
    }

}
