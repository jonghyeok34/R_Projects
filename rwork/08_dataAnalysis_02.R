## ch06
setwd("C:/Users/Administrator/Documents/GitHub/R_Projects/rwork")

#2.조건에 맞는 데이터만 추출
  #조건에 맞는 데이터만 추출
    install.packages("dplyr")
    library(dplyr)
    
    exam <-read.csv("data/08_dataAnalysis/csv_exam.csv")
    exam
  
    ##1반인 경우
    exam %>% filter(class==1)
    
    ##2반인 경우
    exam %>% filter(class==2)
    
    ##1반이 아닐 경우
    exam %>% filter(class !=1)
    
    #3반이 아닌 경우
    exam %>% filter(class !=3)


  #초과 미만 이상 이하
  
    #수학 점수 50점 초과
    exam %>% filter(math >50)
        
    #수학점수 50점 미만
    exam %>% filter(math <50)
  
    # 영어점수가 80 점 이상인 경우
    exam %>% filter(english >=80)
  
    # 영어점수가 80 점 이하인 경우
    exam %>% filter(english <=80)

    
  #여러 조건을 충족하는 행 추출하기 
    
    #1반이면서 수학 점수가 50점 이상인 경우
    exam %>% filter(class ==1 & math >=50)
  
    # 2 반 이면서 영어점수가 80 점 이상인 경우  
    exam %>% filter(class ==2 & english >=80)
  
    
  #여러 조건 중 하나 이상 충족하는 행 추출하기
    
    # 수학 점수가 90 점 이상이거나 영어점수가 90 점 이상인 경우
    exam %>% filter(math >=90 | english >=90)
    exam %>% filter(english <90 | science <50)
    
    exam %>% filter(class ==1 | class ==3 | class ==5)
  
    # %in% 기호
    exam %>% filter(class %in% c(1,3,5)) #1,3,5반에 해당하면 추출
    
  #추출한 행으로 데이터 만들기
    class1 <- exam %>% filter(class ==1)
    class2 <- exam %>% filter(class ==2)  
    
    mean(class1$math)  
    mean(class2$math)
    
  #혼자서 해보기 
    #1.
    mpg <- as.data.frame(ggplot2::mpg)
    se4 <- mpg %>% filter(displ <=4)
    le5 <- mpg %>% filter(displ >=5)     
    
    mean(se4$hwy)
    mean(le5$hwy)
   
    #2.
    mpg_audi<-
      mpg %>% 
        filter(manufacturer =="audi")
    
    mpg_toyota<-
      mpg %>% 
      filter(manufacturer =="toyota")
    
    mean(mpg_audi$cty)
    mean(mpg_toyota$cty)
    
    #3
      mpg %>% 
        filter(manufacturer=="chevrolet" | 
               manufacturer=="ford" |
               manufacturer=="honda") %>%
        group_by(manufacturer) %>%
        summarise(hwy_mean =mean(hwy)) 
        
      mpg_new <- mpg %>% 
        filter(manufacturer %in% c("chevrolet","ford","honda"))
        
      mean(mpg_new$hwy)
    
    
#3.필요한 변수만 추출
    
    exam %>% select(math)
    
    exam %>% select(english)  
    exam %>% select(class,english) 
    
    
    #변수 제외하기
    exam %>% select(-math)
    
    #math, english 제외하기
    exam %>% select(-math,-english)
    
    #dplyr 함수 조합
    # class 가 1 인 행만 추출한 다음 english 추출
    exam %>% filter(class==1) %>% select(english)

    exam %>%
      filter(class ==1) %>%
      select(english)
    
    #일부만 출력
    exam %>%
      select(id,math) %>% 
      head
    
    exam %>%
      select(id,math) %>%
      head(10)
    
    mpg <- as.data.frame(ggplot2::mpg)
    #혼자서 해보기
    mpg_new <-
      mpg %>% 
        select(class,cty) 
    
    
    mpg_new %>%
      filter(class %in% c("suv","compact")) %>%
      group_by(class)
    
    mpg_suv <-
      mpg_new %>%
      filter(class =="suv") %>%
      group_by(class)
    
    mpg_compact <-
      mpg_new %>%
      filter(class =="compact") %>%
      group_by(class)
     
    mean(mpg_suv$cty)         
    mean(mpg_compact$cty)         
    
#정 렬
    #오름 차순
    exam %>% arrange(math)
    
    #내림차순
    exam %>% arrange(desc(math))
    
    #정렬 기준 변수 
    exam %>% arrange(class,math)
    
    #혼자서 해보기
    mpg %>%
      filter(manufacturer=="audi") %>% 
      arrange(desc(hwy)) %>% 
      head(5)
    
   
#파생변수 추가
    exam %>%
        mutate(total =math + english + science) %>%
        head
    
    exam %>%
        mutate(total =math +english, +science,
               mean= (math+english +science)/3) %>%
        head
    
    #mutate()에 ifelse() 적용
    exam %>%
      mutate(test= ifelse(science >= 60, "pass","fail")) %>%
      head
    
    exam %>%
      mutate(total = math +english +science) %>%
      arrange(total) %>%
      head
  
    
    #혼자서 해보기

      #1.
      mpg_new <-
        mpg %>% 
          mutate(total=cty+hwy)
      
      #2.
      mpg_new <-
        mpg_new %>% 
        mutate(average=total/2)
      
      #3
      mpg_new %>% 
        arrange(desc(average)) %>% 
        head(3)
      
      #4
      mpg %>%
        mutate(total=cty+hwy,
               average=total/2) %>% 
        arrange(desc(average)) %>% 
        head(3)
      
#집단별로 요약 -- groupby(), summarize()
    
    #요약하기 
    exam %>% summarise(mean_math = mean(math))
    
    #집단별로 요약
    exam %>%
      group_by(class) %>%
      summarise(mean_math = mean(math))
    
    #여러 통계량 한 번에 산출
    exam %>%
      group_by(class) %>%
      summarise(mean_math =mean(math),
                sum_math = sum(math),
                median_math = median(math),
                n = n())
    
    #각집단별로 다시 집단 나누기
    
    mpg %>%
      group_by(manufacturer, drv) %>%
      summarise(mean_cty = mean(cty)) %>%
      head(10)

    #혼자서 해보기
    
    #1
    mpg %>% 
      group_by(class) %>% 
      summarise(cty_mean=mean(cty))
    
    #2
    mpg %>% 
      group_by(class) %>% 
      summarise(cty_mean=mean(cty)) %>% 
      arrange(desc(cty_mean))
    
    #3
    mpg %>%
      group_by(manufacturer) %>% 
      summarise(hwy_mean = mean(hwy)) %>% 
      arrange(desc(hwy_mean)) %>% 
      head(3)
    
    #4
    mpg %>% 
      filter(class=="compact") %>% 
      group_by(manufacturer) %>% 
      summarise(compact_cnt = table(class)) %>% 
      arrange(desc(compact_cnt))
    
    #4번 정답
    mpg %>% 
      filter(class=="compact") %>% 
      group_by(manufacturer) %>% 
      summarise(count = n()) %>% 
      arrange(desc(count))
    
#7.데이터 합치기
    test1 <-data.frame(id=c(1,2,3,4,5),
                       midterm = c(60,80,70,90,85))
    test2 <-data.frame(id=c(1,2,3,4,5),
                       final = c(70,83,65,95,80))
    test1
    test2    
    
    
    #가로로 합치기
    total <- left_join(test1,test2, by ="id")
    total
    
    #다른 데이터 활용해 변수 추가
    name <- data.frame(class =c(1,2,3,4,5),
                       teacher =c("kim","lee","park","choi","jung"))
    name
      
      
      #class 기준 합치기
      exam_new <- left_join(exam,name, by="class")
      exam_new   
      
    #세로로 합치기 -- bind_rows()
      
      #1~5번 시험 데이터 생성
      group_a <-data.frame(id=c(1,2,3,4,5),
                           test=c(60,80,70,90,85))
      
      #6~10번 시험 데이터 생성    
      group_b <-data.frame(id=c(6,7,8,9,10),
                           test=c(70,83,65,95,80))
      
      group_a
      group_b    
      
      group_all <- bind_rows(group_a, group_b)
      group_all
      
      #혼자서 해보기
      fuel <-data.frame(fl= c("c","d","e","p","r"),
                        price_fl =c(2.35,2.38,2.11,2.76,2.22))
      fuel  
      mpg_cp<-mpg
      head(mpg_cp,3)
      
      mpg_cp <-
        left_join(mpg_cp, fuel, by="fl")
      
      mpg_cp %>% 
        select(model,fl,price_fl) %>% 
        head(5)
      
#분석 도전
    midwest_cp <- as.data.frame(ggplot2::midwest)
    head(midwest_cp)
    
    
    #1
    midwest_cp<-
      midwest_cp %>% 
        mutate(ratio_child=100-(popadults/poptotal)*100)
    
    #2.
    midwest_cp %>% 
      group_by(county) %>% 
      arrange(desc(ratio_child) ) %>% 
      select(county, ratio_child) %>% 
      head(5)
    
    #3.
    midwest_cp %>%
      mutate(childpopGrade = 
               ifelse( ratio_child >= 40, "large",
                       ifelse((ratio_child>=30),"middle","small"))) %>% 
      group_by(childpopGrade) %>% 
      summarise(count = n())
    
    #4
    midwest_cp %>% 
      mutate(asian_rate = (popasian/poptotal)*100) %>% 
      arrange(asian_rate) %>% 
      select(state,county,asian_rate) %>% 
      head(10)
    
    