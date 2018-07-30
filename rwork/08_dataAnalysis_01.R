setwd("C:\Users/Administrator/Dropbox/rwork")

#데이터 파악하기

  #exam 데이터 파악하기
  
    #데이터 준비
    exam <-read.csv("data/08_dataAnalysis/csv_exam.csv")
    exam  
  
  
    #head() - 데이터 앞부분 확인하기
    
    head(exam) #기본:6행 출력
    head(exam,10) #10행까지 출력
    
    #tail() :데이터 뒷부분 확인
    
    tail(exam) #기본:6줄 출력
    tail(exam,10) #10줄 출력
    
    #View() - 뷰어 창에서 데이터 확인하기
    View(exam)
    
    #dim() :몇 행 몇 열로 구성되는지 알아보기
    dim(exam)
    
    #str()- 속성 파악
    str(exam) 
    
    #summary -요약 통계량 산출
    summary(exam) 
  
    
    
  #mpg 데이터 파악하기
    library(ggplot2)
    mpg <-as.data.frame(ggplot2::mpg)
    
    head(mpg)
    
    tail(mpg)
      
    View(mpg)
    
    dim(mpg)
    
    str(mpg)  
    
    summary(mpg)
    
    
    
#데이터 수정 - 변수명 바꾸기
    
    #dplyr 패키지 설치 & 로드
    install.packages("dplyr")
    library(dplyr)
    
    #데이터 프레임 생성
    df_raw <- data.frame(var1 = c(1,2,1),
                         var2 = c(2,3,2))
    
    df_raw    
    
    #1.데이터 프레임 복사본 만들기
    
    df_new <- df_raw
    df_new    
    
    #2.변수명 바꾸기
    df_new <- rename(df_new, v2= var2) #var2f르 v2로 수
    df_new
    
    
    #혼자서 해보기
    
    mpg_practice <- as.data.frame(ggplot2::mpg)
    mpg_copy <- mpg_practice
    
    mpg_copy <-rename(mpg_copy,  city=cty, highway=hwy)  
    
    head(mpg_copy)
    
    
#파생 변수 만들기
    
    #데이터 프레임 생성
    df <- data.frame(var1 = c(4,3,8),
                     var2 = c(2,6,1))
    df    
    
    df$var_sum <- df$var1 + df$var2    
    df   
    
    #파생변수 생성
    df$var_mean <- (df$var1+ df$var2)/2
    df    
    
  #mpg 통합 연비 변수 만들기
    
    mpg$total <- (mpg$cty + mpg$hwy)/2
    head(mpg)    
    mean(mpg$total)
  
  #조건문 활용해 파생변수 만들기  
    summary(mpg$total)
    hist(mpg$total)
    
    #2.조건문으로 합격판정 변수 만들기
    ifelse(mpg$total >=20, "pass", "fail")
    mpg$test <-ifelse(mpg$total >=20, "pass","fail")
    head(mpg,20) 
    
    #3.빈도표로 합격 판정 자동차 수 살펴보기
    table(mpg$test)    
    
    library(ggplot2)
    qplot(mpg$test)    
    
    mpg$grade <- ifelse(mpg$total >=30 , "A",
                        ifelse(mpg$total >=20, "B", "C"))
    
    head(mpg,20)
    table(mpg$grade)
    qplot(mpg$grade)
    
    mpg$grade2 <- ifelse(mpg$total >=30 , "A",
                        ifelse(mpg$total >=25, "B",
                               ifelse(mpg$total >=20,"C","D")
                        )
                 )
    
    head(mpg)
    
    
  #분석 도전
    
    #문제 1. ggplot2 의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
    
    library(ggplot2)
    midwest_frame <-as.data.frame(ggplot2::midwest)    
    head(midwest_frame)
    midwest_frame
    midwest_info <-midwest_frame
    
    head(midwest_info)
    midwest_info <- rename(midwest_info,total= poptotal , asian=popasian  )
  
    #문제 3
    midwest_info$asian_rate <- midwest_info$asian/midwest_info$total *100
    summary(midwest_info)
    
    #문제 4
    midwest_info$asian_ls <-  ifelse( midwest_info$asian_rate>
                                         mean(midwest_info$asian_rate),"large","small" )
    head(midwest_info)
   
    mean(midwest_info$asian_rate)
    
    #문제 5
    table(midwest_info$asian_ls)
    qplot(midwest_info$asian_ls)
    