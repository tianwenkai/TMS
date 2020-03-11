package com.woniu.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
	private Integer coid; // 排课主键
	private Integer cid;// 班级主键
	private Integer classroomid;// 教室主键
	private Integer eid; // 教员主键
	private Date cdate; // 时间
	private Integer disid;// 课程主键

	private Clazz clazz;
	private Classroom classroom;
	private Emp emp;
	private Discipline discipline;

}