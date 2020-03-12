package com.woniu.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Emp {
    private Integer eid;

    private String ename;

    private String esex;

    private Integer eage;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ebirthday;

    private String ebirthplace;

    private String eagree;

    private Integer eteachtime;

    private String estatus;

    private String uname;

    private String upwd;

}