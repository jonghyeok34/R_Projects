
setwd("C:/Users/Administrator/Documents/GitHub/R_Projects/rwork")
#7.데이터 정제
  
  #빠진 데이터 이상한 데이터 제거
  
  #결측치 찾기
  df <-data.frame(sex=c("M","F",NA, "M","F"),
                  score = c(5,4,3,4,NA))
  
  df  
  
  #결측치 확인하기
  is.na(df)
  table(is.na(df))  
  
  table(is.na(df$sex))
  table(is.na(df$score))
  
  #결측치 포함된 상태로 분석 -- 분석 안됨
  mean(df$score)
  sum(df$score) 
  
  #결측치 제거
  
  library(dplyr)
  df %>% filter(is.na(score))  #score이 NA인 데이터만 출력
  
  df %>% filter(!is.na(score))  
  
  df %>% filter(!is.na(sex))  
  
  df_nomiss <- df %>% filter(!is.na(score))
  mean(df_nomiss$score)  
  
  sum(df_nomiss$score)  
  
  
  #여려 변수 동시에 결측치 없는 데이터 추출
  df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
  df_nomiss  

  #결측치가 하나라도 있으면 제거 -na.omit()
  df_nomiss2 <-na.omit(df)  
  df_nomiss2
  
  
  #함수의 결측치 제외 기능 이용 -na.rm =T
  
  mean(df$score, na.rm =T)
  sum(df$score, na.rm=T)  
  
  exam <-read.csv("data/08_dataAnalysis/csv_exam.csv")
  exam[c(3,8,15),"math"] <-NA
  
  exam %>% summarise(mean_math =mean(math))
  
  exam %>% summarise(mean_math =mean(math,na.rm=T),
                     sum_math = sum(math, na.rm=T),
                     median_math =median(math, na.rm=T))

  
  #결측치 대체법 -대표값(평균, 최빈값 등)으로 일괄 대체
  mean(exam$math, na.rm =T)
  
    #평균으로 대체
    exam$math <- ifelse(is.na(exam$math),55,exam$math)
    table(is.na(exam$math))      
        
    exam
    
  #혼자서 해보기
    mpg <-as.data.frame(ggplot2::mpg)
    mpg[c(65,124,131,153,212),"hwy"] <- NA    
    
    #Q1. drv별 
    table(is.na(mpg$drv))
    table(is.na(mpg$hwy))
    
    #Q2. filter를 이용해 -> hwy 변수 결측치 제외
    
    mpg %>%
      filter(!is.na(hwy)) %>%
      group_by(drv) %>%
      select(drv,hwy)
    
    
    mpg %>%
      filter(!is.na(hwy)) %>%
      group_by(drv) %>%
      summarise(mean_hwy = mean(hwy))
    
    
    
    
#이상치정제하기
    
  #이상치 제거하기
    outlier <-data.frame(sex =c(1,2,1,3,2,1),
                         score=c(5,4,3,4,2,6))
    outlier
    
    
    