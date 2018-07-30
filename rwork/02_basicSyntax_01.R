10+20
30+40

10*2

#숫자형
20-30

#변수
c<-sum(10,20,30)


#문자형

c1 <-"r program"
c1

#논리형
3 & 0 # false
3&1  #true

!0  # true <--> false
!3  # false <--> true


#na형 =-  null


#factor형
c4 <-c(1,2,1,2,1,2)
c3 <-c('서울','부산','인천','대전','광주','제주')

fa <-factor(c3)

plot(fa)

#날짜와 시간
Sys.Date()
Sys.time()
substr(Sys.Date(),1,4) #연 정보
substr(Sys.Date(),6,7) #월 정보
substr(Sys.Date(),9,10) #일 정보
substr(Sys.time(),12,19) # 시간:분:초

#날짜로 변환
f1 <-'2018-12-31'
f2 <-'2018-10-31'
d1 <-as.Date(f1) 
d2 <-as.Date(f2)
d1-d2
as.Date('16-12-2016', format ="%d-%m-%Y")
as.Date('2016-12-16', format="%Y 년 %m월 %d일")
#현재 날짜부터 30일 이후의 날
as.Date(30,origin=Sys.Date())
