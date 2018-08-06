setwd("C:/Users/Administrator/Google 드라이브/2018년 소프트웨어 수업/수업 내용/R/문서/ch08")

score <- c(85,90,93,86,82)

mean(score)

median(score)

var(score)

sd(score)


height <- rnorm(n=100000,mean=168, sd=7)

hist(height,breaks=100, probability = T)

lines(density(height,bw=0.5),col="red",lwd=1)

#t검정 -- t.test() --> p-value 가 5보다 크므로 대립가설 채

score1 <- read.csv("tdata.csv",header=T)
score1

result <-t.test(score1$성적, alternative=c("greater"),mu=75)
result

score2 <-read.csv("tdata2.csv", header=T)
score2

result.score2 <- t.test(score2$성적, alternative=c("greater"),mu=75)
result.score2


#카이 제곱 분포 -- 음수 부분 x -- 평균기준으로 양수 쪽만 만듦

fruits1 <- read.csv("love_fruits.csv",header=T)
fruits1


#빈도 계산
round(prop.table(table(fruits1$선호과일))*100,2)

table(fruits1$선호과일)
count <- c(table(fruits1$선호과일))
pct <- c(round(prop.table(table(fruits1$선호과일))*100,2))
love_fruits <- data.frame(건수 =count,비율=pct)
love_fruits


barplot(love_fruits$건수,
        names.arg=c("바나나","복숭아","사과","체리","포도"),
        ylim=c(0,15),
        col=rainbow(5))

pie(love_fruits$건수,col=rainbow(5),
    init.angle=90,
    label=pct)
legend(0.8,1,c("바나나","복숭아","사과","체리","포도"),
       cex=0.7,
       fill=rainbow(5))

#상관 관계 분석(상관 분석) -cor()
  
  #예 : 안내메일(DM) 을 발송하는 회수와 제품이 판매개수 관계

  x <- c(3,5,8,11,13)# 제품 판매 개수(x) : 3 , 5 , 8 , 11 , 13
  y <- c(1,2,3,4,5) # DM 발송 회수(y) : 1 , 2 , 3 , 4 , 5
  
  cor(x,y)
  
  
#회귀 분석(선형 회귀 분석 : Simple Linear Regression)

  #문제1
  x<- c(110,120,130,140,150)
  y<- c(100,105,128,115,142)
  
  plot(x,y,pch=20, col="red")  
  
  line <- lm(y~x) # lm = linear model
  line
  
  abline(line,col="blue")
  
  child_iq <- -4.2 +(117 *0.94)
  child_iq    
  
  
  #문제 2
  
  score<- read.csv("score.txt",header=T,sep=",")
  attach(score)
  score  
  
  lm1 <-lm(성적~IQ)
  lm1  
  
  y <- -5.2918 + 0.6714 * 125 #IQ가 125일 경우 예상 점수 계산
  y
  
  plot(IQ,성적,pch=20,col="red")
  abline(lm1,col="blue")
  
  coef(lm1)
  
  #각 학생 별로 회귀식을 적용해서 IQ가 125 일 경우 받을 예상 점수
  predict(lm1, newdata=data.frame(x=c(125,125,125,125,125,125,125,125,125,125)))
  
  
  #각 학생들이 학원을 5개 다닐 경우 예상 성적 
  lm2 <- lm(성적~다니는학원수)
  lm2  
  
  predict(lm2,newdata=data.frame(x=5))
  
  
#다중회귀 분석(독립 변수가 2개 이상인 경우)
  lm3 <- lm(성적~IQ+다니는학원수+게임하는시간+TV시청시간)
  lm3
  
  y = 23.2992 + (0.4684*130) +(0.7179*3) - (0.8390*2) -(1.3854*1)
  y
  