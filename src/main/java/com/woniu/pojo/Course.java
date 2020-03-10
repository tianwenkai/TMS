package com.woniu.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
    private Integer coid;

    private Integer cid;

    private Integer classroomid;

    private Integer eid;

    private Date cdate;

}