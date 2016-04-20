package com.wiring.bnn.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LoggingAspect {
	
	public void beforeLogging(JoinPoint joinPoint){
		//joinPoint가 해당 메서드

		Signature signature = joinPoint.getSignature();
		System.out.println("::::로그처리(메서드 수행 전)::::");
		System.out.println("이름 : "+signature.getName());
		System.out.println("타입 : "+signature.getDeclaringTypeName());
	}

}
