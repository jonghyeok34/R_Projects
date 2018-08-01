  setwd("C:/Users/Administrator/Google 드라이브/2018년 소프트웨어 수업/수업 내용/R/문서/data_analysis")
#분석 준비

  #한국 복지패널 데이터
  install.packages("foreign")
  library(foreign)
  library(dplyr)  
  library(ggplot2)
  library(readxl)
  
  #데이터 준비하기
  raw_welfare <- read.spss(file= "Koweps_hpc10_2015_beta1.sav",
                           to.data.frame = T)
  
  #복사본 만들기
  welfare <- raw_welfare
  
  #데이터 검토
  head(welfare)
  tail(welfare)
  View(welfare)
  dim(welfare)
  str(welfare)  
  summary(welfare)
  
  welfare <- rename(welfare,
                    sex =h10_g3,
                    birth = h10_g4,
                    marriage = h10_g10,
                    religion =h10_g11,
                    income = p1002_8aq1,
                    code_job = h10_eco9,
                    code_region = h10_reg7)

#성별 변수 검토 및 전처리
  
  #1.변수 검토
  class(welfare$sex)  
  
  #2.전처리
  table(welfare$sex)  
  
  #이상치 결측처리
  welfare$sex <-ifelse(welfare$sex ==9, NA, welfare$sex)
  
  #결측치 확인
  table(is.na(welfare$sex))
  
  #성별 항목 이름 부여
  
  welfare$sex <- ifelse(welfare$sex ==1, "male","female")
  table(welfare$sex)
  
  qplot(welfare$sex)  

#월급 변수 검토 및 전처리
  
  #1.변수 검토하기
    class(welfare$income)
    
    summary(welfare$income)  
    
    qplot(welfare$income)
    
    qplot(welfare$income) +xlim(0,1000)
  
  #2.전처리
  
    #이상치 확인
    summary(welfare$income)
    
    #이상치 결측 처리
    welfare$income <-
      ifelse(welfare$income %in% c(0,9999),NA, welfare$income)
    
    table(is.na(welfare$income))
  
#성별에 따른 월급 차이 분석하기
  
  #1.성별 월급 평균표 만들기
  sex_income <- welfare %>%
    filter(!is.na(income)) %>%
    group_by(sex) %>%
    summarise(mean_income = mean(income))
  
  sex_income  
  
  #2.그래프 만들기
  
  ggplot(data=sex_income,
         aes(x=sex,y=mean_income)) +geom_col()
   
  
#3.나이와 월급의 관계

  #1)변수 검토하기
  class(welfare$birth)
  
  summary(welfare$birth)  
  
  qplot(welfare$birth)      
  
  #2) 전처리
  
    #이상치 확인
    summary(welfare$birth)

    #결측치 확인
    table(is.na(welfare$birth))
    
    #이상치 결측처리
    welfare$birth <- ifelse(welfare$birth ==9999, NA,welfare$birth)
    table(is.na(welfare$birth))
    
    
  #3)파생 변수 만들기 -나이
    
    welfare$age <- 2015 -welfare$birth +1
    summary(welfare$age)
    qplot(welfare$age)
          
    
#나이와 월급의 관계 분석
    
    age_income <-welfare %>%
      filter(!is.na(income)) %>%
      group_by(age) %>%
      summarise(mean_income = mean(income))
    
    head(age_income)
    
    #그래프 만들기
    ggplot(data= age_income,
           aes(x=age, y=mean_income)) + geom_line()
    
    
#연령대에 따른 월급 차이
    welfare <-welfare %>%
      mutate(ageg = ifelse(age<30, "young",
                           ifelse(age <=59, "middle","old")))
    table(welfare$ageg)    
    qplot(welfare$ageg)
    
    #1)연령대별 월급 평균표 만들기
    ageg_income <-welfare %>%
      filter(!is.na(income)) %>%
      group_by(ageg) %>%
      summarise(mean_income= mean(income)) 
    
    ageg_income    
    
    #2)그래프 만들기
    ggplot(data= ageg_income, 
           aes(x=ageg, y=mean_income)) +geom_col()    
    
    #막대 정렬 
    ggplot(data=ageg_income,aes(x=ageg, y=mean_income)) +
      geom_col()+
      scale_x_discrete(limits=c("young","middle","old"))

#연령대 및 성별 월급차이  
    
    #1)연령대 및 성별 월급 평균표 만들기
    sex_income <-welfare %>%
      filter(!is.na(income)) %>%
      group_by(ageg, sex) %>%
      summarise(mean_income= mean(income))

    sex_income    
    
    #2)그래프 만들기
    ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill=sex))+
      geom_col()+
      scale_x_discrete(limits =c("young","middle","old"))
    
    #3)성별 막대 분리
    ggplot(data =sex_income, aes(x=ageg, y=mean_income, fill=sex)) +
      geom_col(position ="dodge") +
      scale_x_discrete(limits = c("young","middle","old"))
    
    sex_age <- welfare %>%
      filter(!is.na(income)) %>%
      group_by(age,sex) %>%
      summarise(mean_income =mean(income))
    
    head(sex_age) 
    
    ggplot(data=sex_age , 
           aes(x=age, y=mean_income, col=sex)) +geom_line()

    
#직업별 월급 차이
    
    #1)변수 검토하기
    class(welfare$code_job)
    table(welfare$code_job)    
    
    #2)전처리
    library(readxl)
    list_job <-read_excel("Koweps_Codebook.xlsx",col_names=T,sheet=2)
    head(list_job)            
    
    dim(list_job)    
    
    
    welfare <- left_join(welfare, list_job, id="code_job")
    
    welfare %>%
      filter(!is.na(code_job)) %>%
      select(code_job, job) %>%
      head(10)
    
    
#직업별 월급 차이 분석
    
    #1) 직업별 월급 평균표 만들기
    job_income <- welfare %>%
      filter(!is.na(job) & !is.na(income)) %>%
      group_by(job) %>%
      summarise(mean_income =mean(income))
    
    head(job_income) 
    
    #2)상위 10개 추출
    top10 <- job_income %>%
      arrange(desc(mean_income)) %>%
      head(10)
    top10
    
    #3)그래프 만들기
    ggplot(data=top10, 
           aes(x=reorder(job, mean_income), y=mean_income)) +
      geom_col()+
      coord_flip()
    
    #4)하위 10위 추출
    bottom10 <- job_income %>%
      arrange(mean_income) %>%
      head(10)

    bottom10    
    
    #5)그래프 만들기
    ggplot(data=bottom10,
           aes(x=reorder(job,mean_income), y=mean_income)) +
      geom_col()+
      coord_flip() +
      ylim(0,850)
    
    
#7.성별 직업 빈도
    
    #1) 성별 직업 빈도표 만들기
      
      # 남성 직업 빈도 상위 10 개 추출
      job_male <- welfare %>%
        filter(!is.na(job) & sex =="male") %>%
        group_by(job) %>%
        summarise(n=n()) %>%
        arrange(desc(n)) %>%
        head(10)
      
      job_male
      
      # 여성 직업 빈도 상위 10 개 추출
      job_female <- welfare %>%
        filter(!is.na(job) & sex =="female") %>%
        group_by(job) %>%
        summarise(n=n()) %>%
        arrange(desc(n)) %>%
        head(10)
      
      job_female    
    
      
    #2)그래프 만들기
      
      #남성 직업 빈도 상위 10개 직업
      ggplot(data=job_male, aes(x=reorder(job,n),y=n)) +
        geom_col()+
        coord_flip()
      
      # 여성 직업 빈도 상위 10 개 직업
      ggplot(data=job_female, aes(x=reorder(job,n),y=n)) +
        geom_col()+
        coord_flip()
      
#종교 유무에 따른 이혼율
      
    #종교 변수 검토 및 전처리
    
      #1)변수 검토
      class(welfare$religion)
      
      table(welfare$religion)            

      #2)전처리
      welfare$religion <- ifelse(welfare$religion ==1, "yes","no")
      table(welfare$religion)            
      
      qplot(welfare$religion)      
      
    #혼인 상태 변수 검토 및 전처리하기
    
      #1)변수 검토
      class(welfare$marriage)
      table(welfare$marriage) 
      
      #2)전처리
        #이혼 여부 변수 만들기
        welfare$group_marriage <- 
          ifelse(welfare$marriage ==1, "marriage",
          ifelse(welfare$marriage ==3, "divorce",NA))
        
        table(welfare$group_marriage)      
        
        table(is.na(welfare$group_marriage))
        
        qplot(welfare$group_marriage)       

        
#종교 유무에 따른 이혼율 분석
  
  #1)종교 유무에 따른 이혼율 표
    religion_marriage <- welfare %>%
      filter(!is.na(group_marriage)) %>%
      group_by(religion, group_marriage) %>%
      summarise(n=n()) %>%
      mutate(tot_group=sum(n)) %>%
      mutate(pct= round(n/tot_group*100,1))
    
    religion_marriage    
    
    #count() 활용
    religion_marriage <- welfare %>%
      filter(!is.na(group_marriage)) %>%
      count(religion, group_marriage) %>%
      group_by(religion) %>%
      mutate(pct= round(n/sum(n)*100, 1))
  
  #2)이혼율표 만들기
  
    #이혼 추출
    divorce <- religion_marriage %>%
      filter(group_marriage == "divorce") %>%
      select(religion, pct)
    
    divorce    
  
  #3)그래프 만들기
    ggplot(data=divorce, aes(x=religion, y=pct)) +geom_col()
  
    
#연령대 및 종교 유무에 따른 이혼율 분석

    #1) 연령대별 이혼율 표 만들기
    ageg_marriage <- welfare %>%
      filter(!is.na(group_marriage)) %>%
      group_by(ageg, group_marriage) %>%
      summarise(n=n()) %>%
      mutate(tot_group=sum(n)) %>%
      mutate(pct= round(n/tot_group*100, 1))

    ageg_marriage    
    
      #count()활용
      ageg_marriage <-welfare %>%
        filter(!is.na(group_marriage)) %>%
        count(ageg, group_marriage) %>%
        group_by(ageg) %>%
        mutate(pct= round(n/sum(n)*100,1))

    ageg_marriage  
    
    #2)연령대별 이혼율 그래프
    
      ageg_divorce <- ageg_marriage %>%
        filter(ageg != "young" & group_marriage == "divorce" ) %>%
        select(ageg, pct)
      
      ageg_divorce      
       
      #그래프 만들기
      ggplot(data=ageg_divorce, aes(x=ageg, y=pct)) + geom_col()
      
    #3)연령대 및 종교 유무에 따른 이혼율 표 만들기
  
              