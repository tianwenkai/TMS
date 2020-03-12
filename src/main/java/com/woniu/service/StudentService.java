package com.woniu.service;

import java.util.List;
import java.util.Map;

import com.woniu.pojo.PageBean;
import com.woniu.pojo.Student;

public interface StudentService {

    /*查询所有学生信息*/
    List<Student> findAll();

    /*学生登陆，查询和账号名密码匹配的学生信息*/
    Student login(Student student);

    /*根据教师id查询教师所管理学生，同时分页，模糊处理的学生集合*/
    List<Student> findAllByPageAndClazzId(Map<String, Object> map);

    /*根据教师id查询教师所管理学生再经过分模糊处理后，学生条目数*/
    int countAllByPageAndClazzId(Map<String, Object> map);


    void save(Student student);

    Student findOneByStudentId(Integer sid);

    void update(Student student);

    List<Student> findAllByPage(PageBean<Student> pageBean);

    int countAllByPage(PageBean<Student> pageBean);

    void delete(Integer id);

    void deleteByIds(Integer[] ids);

    void usernamepasswordUpdate(Student student);

    void updateOne(Student student);
}
