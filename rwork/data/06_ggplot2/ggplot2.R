1+1

install.packages("ggplot2")
library(ggplot2)


#예1
korean <- read.table("학생별국어성적_new.txt",header=T,sep=",")
korean
ggplot(korean,aes(x=이름,y=점수)) + geom_point()

ggplot(korean,aes(x=이름,y=점수)) + geom_bar(stat="identity")

ggplot(korean,aes(x=이름,y=점수)) + geom_bar(stat="identity",fill="green",
                                                 colour="red")

gg <- ggplot(korean,aes(x=이름,y=점수)) + geom_bar(stat="identity",fill="green",
                                               colour="red")
gg + theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1,
                                    color="blue",size=8))





#예2
score_kem <- read.csv("학생별과목별성적_국영수_new.csv",header=T)
score_kem

install.packages("plyr")
library(plyr)

sort_kem <- arrange(score_kem,이름,과목)
sort_kem

sort_kem2 <- ddply(sort_kem,"이름",transform,누적합계=cumsum(점수))
sort_kem2

sort_kem3 <- ddply(sort_kem2,"이름",transform,누적합계=cumsum(점수), label=cumsum(점수)-0.5*점수)
sort_kem3

ggplot(sort_kem3,aes(x=이름,y=점수,fill=과목)) + geom_bar(stat="identity") +        geom_text(aes(y=label,label=paste(점수,'점')),colour="black",size=4)

ggplot(sort_kem3,aes(x=이름,y=점수,fill=과목)) + geom_bar(stat="identity")           + geom_text(aes(y=label,label=paste(점수,'점')),colour="black",size=4)


gg2 <- ggplot(sort_kem3,aes(x=이름,y=점수,fill=과목))  +        
  geom_bar(stat="identity") +
  geom_text(aes(y=label,label=paste(점수,'점')),colour="black",size=4) +             guides(fill=guide_legend(reverse=T))

gg2 + theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1,
                                     colour="black", size=8))





#예3
score <- read.table("학생별전체성적_new.txt",header=T,sep=",")
score

score[,c("이름","영어")]

ggplot(score,aes(x=영어,y=reorder(이름,영어))) + 
  geom_point(size=6) +
  theme_bw( ) +
  theme(panel.grid.major.x=element_blank( ) ,
        panel.grid.minor.x=element_blank( ) ,
        panel.grid.major.y=element_line(color="red",linetype="dashed"))

ggplot(score,aes(x=영어,y=reorder(이름,영어))) + 
  geom_segment(aes(yend=이름),xend=0,color="blue") +
  geom_point(size=6,color="green") +
  theme_bw() +
  theme(panel.grid.major.y=element_blank())





# 예4
install.packages("gridExtra")
library(gridExtra)

v_mt <- mtcars
v_mt

graph1 <- ggplot(v_mt,aes(x=hp , y=mpg))
graph1 + geom_point()

setwd("d:/rwork/rpro")
savePlot("graph1.png",type="png")


#그래프 출력 – 색상 변경하기
graph2 <- graph1 + geom_point(colour="blue") 
graph2


#그래프 출력 – 종류별로 다른 색상 지정하기 
graph3 <- graph2 + geom_point(aes(color=factor(am))) 
graph3
savePlot("graph3.png",type="png")


#그래프 출력 – 크기 변경하기 
graph4 <- graph1 + geom_point(size = 7) 
graph4
savePlot("graph4.png",type="png")


#그래프 출력 – 값 별로 서로 다른 크기 지정하기
graph5 <- graph1 + geom_point(aes(size = wt))
graph5
savePlot("graph5.png",type="png")


#그래프 출력 – 종류별로 크기와 모양 지정하기
graph6 <- graph1 + geom_point(aes(shape=factor(am),size = wt))
graph6
savePlot("graph6.png",type="png")


#그래프 출력 – 종류별로 크기, 모양, 색상 지정하기
graph7 <- graph1 + geom_point(aes(shape=factor(am),color=factor(am),size = wt)) + 
  scale_color_manual(values=c("red","green"))
graph7
savePlot("graph7.png",type="png")


#그래프 출력 – 선 추가하기
graph8 <- graph1 + geom_point(color="red") + geom_line()
graph8
savePlot("graph8.png",type="png")



#그래프 출력 – x축(마력)과 y축(연비) 이름 바꾸기
graph9 <- graph1 + geom_point(color="blue") + labs(x="마력" , y="연비(mile/gallon)")
graph9
savePlot("graph9.png",type="png")





#예5
three <- read.csv("학생별과목별성적_3기_3명.csv",header=T)
three


#데이터를 이름과 과목 순서대로 정렬
sort_score <- arrange(three,이름,과목)
sort_score


#그래프  출력
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름)) +
  geom_line( )


#그래프  출력 –  각 과목의 점수에 점을 추가
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름)) + 
  geom_line( ) + geom_point( )


#그래프  출력 –  각 과목의 점수에  점의 크기와 모양을 지정
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름,fill=이름)) + 
  geom_line( ) + geom_point(size=6,shape=22 )






#예6
dis <- read.csv("1군전염병발병현황_년도별.csv",stringsAsFactors=F)
dis


#그래프  출력 –  geom_line() 함수로 선모양으로 출력
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + geom_line( )


#그래프  출력 –  geom_area() 함수로 선그래프 아래 부분에 색을 넣어서 출력
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + geom_area( )


#그래프  출력 –  geom_area() 함수로 선그래프 아래 부분에 색을 넣어서 출력
#               ( 선색깔: red, 내용: cyan, 투명도: 04 )
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + 
  geom_area(color="red",fill="cyan",alpha=0.4)


#그래프  출력 –  geom_area() 함수로 선그래프 아래 부분에 색을 넣어서 출력
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + 
  geom_area(fill="cyan",alpha=0.4) + geom_line( )


#그래프  출력 –  geom_area() 함수로 선그래프 아래 부분에 색을 넣어서 출력
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + geom_area( )


#그래프  출력 –  geom_area() 함수로 선그래프 아래 부분에 색을 넣어서 출력
#               ( 선색깔: red, 선아래 색깔: cyan, 투명도: 04 )
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + 
  geom_area(color="red",fill="cyan",alpha=0.4)


#그래프  출력 –  geom_area() 함수로 선그래프 아래 부분에 색을 넣어서 출력
#                ( 선아래 색깔:cyan, 투명도: 04 )
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + 
  geom_area(fill="cyan",alpha=0.4) + geom_line( )


















