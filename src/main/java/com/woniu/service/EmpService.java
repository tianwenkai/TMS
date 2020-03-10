package com.woniu.service;

import java.util.List;

import com.woniu.pojo.Emp;

public interface EmpService {

	List<Emp> findAll();

	Emp login(Emp emp);

}
