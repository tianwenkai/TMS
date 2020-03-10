package com.woniu.pojo;

import java.util.Date;

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

    private Date ebirthday;

    private String ebirthplace;

    private Integer ephone;

    private String eemail;

    private String eagree;

    private Integer eteachtime;

    private String estatus;

    private String uname;

    private String upwd;

}