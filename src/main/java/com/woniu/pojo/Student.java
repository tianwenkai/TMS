package com.woniu.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    private Integer sid;

    private Integer cid;

    private Integer rid;

    private Integer eid;

    private String sname;

    private String ssex;

    private Integer sage;

    private Integer sphone;

    private String semail;

    private Date sbirthday;

    private String sbirthplace;

    private String paystatus;

    private String sdepict;

    private String uname;

    private String upwd;

}