package com.baizhi.spring;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan("com.baizhi.spring.dao")
public class Go {

    public static void main(String[] args) {
        SpringApplication.run(Go.class,args);
    }

}
