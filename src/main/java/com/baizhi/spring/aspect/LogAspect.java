package com.baizhi.spring.aspect;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.Configuration;

@Configuration
@Aspect
public class LogAspect {
   @Around("execution(* com.baizhi.spring.service.*.*(..))")
    public  Object lalal(ProceedingJoinPoint proceedingJoinPoint){
         Object aaa=null;
       try {
           aaa= proceedingJoinPoint.proceed();
       } catch (Throwable throwable) {
           throwable.printStackTrace();
       }
        return  aaa;
   }

}
