package com.woniu.dao;

import com.woniu.pojo.PageBean;
import com.woniu.pojo.Student;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentDao {

    Student login(Student student);

    List<Student> findAll();

    List<Student> findAllByPageAndClazzId(Map<String, Object> map);

    int countAllByPageAndClazzId(Map<String, Object> map);

    void save(Student student);

    Student findOneByStudentId(Integer sid);

    void update(Student student);

    List<Student> findAllByPage(@Param("pageBean")PageBean<Student> pageBean);

    int countAllByPage(@Param("pageBean")PageBean<Student> pageBean);

    void delete(Integer id);

    void deleteByIds(Integer[] ids);

    void usernamepasswordUpdate(Student student);

    void updateOne(Student student);
}