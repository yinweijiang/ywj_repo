package com.povertyrelief;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Author: Yin Weijiang
 * @Date: 2022-03-14 19:59:12
 * @Version:v1.0
 * @Description: PovertyReilefApplication
 */
@MapperScan("com.povertyrelief.mapper")
@SpringBootApplication
public class PovertyReilefApplication {
    public static void main(String[] args) {
        SpringApplication.run(PovertyReilefApplication.class,args);
    }

}
