package com.woniu.dao;

import java.util.List;

import com.woniu.pojo.Emp;

public interface EmpDao {

	List<Emp> findAll();

	Emp login(Emp emp);

}
