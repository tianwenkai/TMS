package com.woniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Classroom {
    private Integer classroomid;

    private String classroomname;

    private Integer cappeople;

    private String classroomstatus;

   
}