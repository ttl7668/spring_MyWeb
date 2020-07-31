package com.team404.util.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

//AOP선언방법은 크게 2가지, 직접 전부 빈생성, pointcut을 빈으로 표현
//어노테이션 방법

@Aspect //AOP클래스로 동작
@Component //빈으로 생성됩니다
public class LogAdvice {
   
   private static final Logger log = LoggerFactory.getLogger(LogAdvice.class);
//   //앞에 *는 접근제한자, 뒤에 *는 모든메서드를 의미함
//   @Before("execution(* com.team404.user.service.UserServiceImpl.*(..))")
//   public void beforeLog() {
//      System.out.println("메서드 실행전 : ");
//      
//   }
//   
//   @After("execution(* com.team404.user.service.UserServiceImpl.*(..))")
//   public void afterLog() {
//      System.out.println("메서드 수행 후 : ");
//   }
//   <!-- 사용자로그 추가 -->
//   <logger name="com.team404.util.aop">
//      <level value="info"/>
//   </logger>
   
   //타겟에 밀접하게 붙어서 함께 동작되는 기능
   @Around("execution(* com.team404.*.service.*ServiceImpl.*(..))")
   public Object aroundLog(ProceedingJoinPoint jp) {
      log.info("적용 클래스 : " + jp.getTarget());
      log.info("적용 메서드 : " + jp.getSignature());
      log.info("적용 파라미터 : " + Arrays.toString(jp.getArgs()));
      
      long start = System.currentTimeMillis(); //시작시간
      Object result = null;
      try {
         result = jp.proceed(); //proceed() 타겟메서드의 실행
      } catch (Throwable e) {
         e.printStackTrace();
      }
      long end = System.currentTimeMillis(); //끝시간
      System.out.println("메서드수행시간:" + (end-start)*0.001);
      return result;
   }
}