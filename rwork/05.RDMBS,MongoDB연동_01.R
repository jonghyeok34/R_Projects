
#example1
  
  #1.RJDBC 패키지 설치
  install.packages("RJDBC")
  
  #2.패키지 로드
  library(RJDBC)
  
  #3.드라이버 설정
  jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver",
                     classPath="c:/ojdbc6.jar")
  
  #4.데이터 베이스 연결
  conn <-dbConnect(jdbcDriver, 
                   "jdbc:oracle:thin:@localhost:1521/xe",
                   "scott","tiger")
  
  #5.쿼리 만들기
  myquery <- "select sal, comm from emp where comm is not null"
  
  #6.쿼리 실행 결과 저장
  r <-dbGetQuery(conn,myquery);
  r
  
  #7.차트 만들기
  plot(r)

#예2
  
  #1.RJDBC 패키지 설치
  install.packages("RJDBC")
  
  #2.패키지 로드
  library(RJDBC)
  
  #3.드라이버 설정
  jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver",
                     classPath="c:/ojdbc6.jar")
  
  #4.데이터 베이스 연결
  conn <-dbConnect(jdbcDriver, 
                   "jdbc:oracle:thin:@localhost:1521/xe",
                   "scott","tiger")
  
  #5.쿼리 만들기
  myquery <- "select
              deptno, count(*) cnt, round(avg(sal)) avg, max(sal) max, min(sal) min 
              from emp group by deptno order by deptno"
  
  #6.쿼리를 실행하고 결과를 저장하기
  r <- dbGetQuery(conn,myquery); r  

  #7.부서별 사원 수를 가지고 기본적인 막대 차트 만들기

  barplot(r$CNT)

  
  #8.위의 막대 그래프에 y축 범위를 늘리는 설정
  barplot(r$CNT,ylim=c(0,8))
  
  #9. 막대 그래프 하단에 라벨을 추가
  barplot(r$CNT,ylim=c(0,8), names.arg=r$DEPTNO)
  
  #10. 색깔 입히기
  barplot(r$CNT,ylim=c(0,8), 
          names.arg=r$DEPTNO,
          col= c("red","green","blue"))
  
  #11.위의 결과에 제목과 y축 라벨 넣기
  
  
   barplot(r$AVG,
          ylim=c(0,5000), 
          names.arg=r$DEPTNO,
          col= c("red","green","blue"), 
          ylab="달러($)")
  
  
  #12.분석 대상을 부서별 평균 급여로 변경하기
   barplot(r$AVG,
           ylim=c(0,5000), 
           names.arg=r$DEPTNO,
           col= c("red","green","blue"), 
           ylab="달러($)", 
           main="부서별 평균급여")
  
#예3
   
   #1.3개의 컬럼을 그래프에 추가하기 위해 데이터 추출
   r2<- r[,c(3:5)]
   r2 
   
   #3.그래프 만들기
   barplot(as.matrix(r2),
           ylim=c(0,5000),
           beside=T,
           col=c("red","green","blue"))
   
   #4.범례 추가
   legend("topright",
          inset=.05,
          title="Count of product",
          c("10","20","30"),
          fill=c("red","green","blue"),
          horiz=TRUE)
   
#예4
  
   #1.80~90 사이의 숫자를 30개 만들기
   myquery <-
    "SELECT level as day,ceil(dbms_random.value(80, 90)) as amt 
    FROM dual connect by level <= 30"
   
   #2.쿼리 실행
   r <- dbGetQuery(conn, myquery)
   
   #3.산점도 그리기
   plot(r)
   
   #4.y축 범위 설정
   plot(r,ylim=c(50,100))
   
   #5.line 만들기
   plot(r,
        ylim=c(50,100),
        type="l",  # l =lines, b:both
        lty=1) #lty = line type
   
   #6.선 색상과 제목 만들기
   plot(r,
        ylim=c(77,92),
        col="red",
        type="o",
        lty=2,
        main="월 매출 추이")
   
#예5
  
   #1.80-90사이의 숫자를 30개 만들기
   myquery <-" 
SELECT job, round(sum(sal)/(SELECT sum(sal) FROM emp), 2) ratio FROM emp GROUP BY job ORDER BY job"
   
   #2.쿼리 실행
   r <- dbGetQuery(conn, myquery)
   r
   #3.pie 차트 그리기
   pie(r$RATIO)
   
   #4.라벨 붙이기
   pie(r$RATIO, labels=r$JOB)

   #5.색상을 설정하기 위하여 직업의 종류 알아내기
   query2 <- "SELECT count(distinct job) job_cnt FROM emp"
   
   r2 <- dbGetQuery(conn, query2);r2
   
   #7.색상 설정
   pie(r$RATIO,
       lables =r$JOB,
       col=rainbow(r2$JOB_CNT),
       border="white")
   
   #8.비율이 포함된 라벨을 만들기
   job_labels <- sprintf("%s(%.2f%s)",r$JOB, r$RATIO*100, "%"); job_labels
    
   #9. 라벨 붙이기
   
   pie(r$RATIO,
       labels =job_labels,
       col=rainbow(r2$JOB_CNT),
       border="white")
   
   #8.비율이 포함된 라벨을 만들기
   job_labels <- 
     paste(r$JOB,"\n","(", r$RATIO*100, "%)"); job_labels
   
   pie(r$RATIO, labels = job_labels , col=rainbow(r2$JOB_CNT), border="white")
   