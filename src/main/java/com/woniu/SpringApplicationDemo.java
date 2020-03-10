package com.woniu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
//扫包
@MapperScan("com.woniu.dao")
//事务管理
@EnableTransactionManagement
public class SpringApplicationDemo {

	public static void main(String[] args) {
		SpringApplication.run(SpringApplicationDemo.class, args);
	}

}
