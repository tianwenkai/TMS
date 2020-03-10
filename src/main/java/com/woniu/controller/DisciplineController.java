package com.woniu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.woniu.service.DisciplineService;

@Controller
public class DisciplineController {
	@Autowired
	DisciplineService disciplineService;
}
