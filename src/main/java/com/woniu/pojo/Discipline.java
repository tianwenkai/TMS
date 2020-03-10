package com.woniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Discipline {
    private Integer disid;

    private Integer cid;

    private Integer eid;

    private String disname;

    private Integer discost;

    private Integer discoursetime;

    private String disstatus;
}