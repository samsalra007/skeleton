package com.wolfbear.skeleton;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.wolfbear.skeleton")
public class SkeletonApi {

    public static void main(String[] args) {
        SpringApplication.run(SkeletonApi.class, args);
    }
}
