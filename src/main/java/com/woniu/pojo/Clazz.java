package com.woniu.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Clazz {
	private Integer cid;

	private String cname;

	private Integer cpeoplecount;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cstarttime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date clasttime;

	private String cstatus;

	private String cdepict;

}