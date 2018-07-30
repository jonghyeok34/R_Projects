#그래프 그리기

#1. plot()함수

  var1 <- c(1,2,3,4,5)
  plot(var1)
  
  #x,y 축의 값을 다 지정해서 출
  x<-1:3
  y<-3:1
  plot(x,y)  
  
  #x,y 축의 최대 한계값 지정
  x<-1:3
  y<-3:1
  plot(x,y, xlim=c(0,5), ylim=c(0,5))  
  
  #x,y 축의 라벨, 메인 타이
  x<-1:3
  y<-3:1
  plot(x,y, xlim=c(0,5), ylim=c(0,5),
      xlab="x축 값",ylab="y축 값",
      main="Plot test")  

  #
  v1 <- c(100,130,120,160,150)
  plot(v1,type='o',col='red',ylim=c(0,200),
         axes=FALSE,ann=FALSE)
  axis(1,at=1:5,
       lab=c("MON","TUE","WED","THU","FRI"))
  axis(2,ylim=c(0,200))
  
  title(main="FRUIT",col.main="red",font.main=4)  
  
  title(xlab="DAY",col.lab="black")  
  title(ylab="PRICE",col.lab="blue")  
  
  #(7) 그래프의 배치 조정하기 – mfrow : 1행 3열에 그래프 출력
  par(mfrow=c(1,3))
  plot(v1,type="o")
  plot(v1,type="s")
  plot(v1,type="l")

#2.barplot()
  
  x<-c(1,2,3,4,5)
  barplot(x)
  
  #가로로 출력 -horiz
  x<- c(1,2,3,4,5)
  barplot(x,horiz=T)
  
  #그룹으로 묶어서 출력 -beside
  x<- matrix(c(5,4,3,2),2,2)
  barplot(x,
          beside=T,
          names=c(5,3),
          col=c("green","yellow"))
  
  #하나의 막대로 출력
  
  x<- matrix(c(5,4,3,2),2,2)
  barplot(x,
          names=c(5,3),
          col=c("green","yellow"),
          ylim=c(0,12))
  
  x<-matrix(c(5,4,3,2),2,2)
  par(oma=c(1,0.5,1,0.5))  
  barplot(x,names=c(5,3),beside=T,col=c("green","yellow"),horiz=T)  
  #(7) 여러 막대 그래프를 그룹으로 묶어서 한꺼번에 출력하기
   v1 <- c(100,120,140,160,180)
   v2 <- c(120,130,150,140,170)
   v3 <- c(140,170,120,110,160)
  
   qty <- data.frame(BANANA=v1,
                    CHERRY=v2,
                    ORANGE=v3)
   qty
  
   barplot(as.matrix(qty),
           main="Fruit's Sales QTY" ,
           beside=T,
           col=rainbow(nrow(qty)),
           ylim=c(0,400))
   legend(14,400,
          c("MON","TUE","WED","THU","FRI"),
          cex=0.8,
          fill=rainbow(nrow(qty)))
   
   
#3. hist()함수
  #hist() 함수 : histogram 그래프 그리기
   height <- c(182,175,167,172,163,178,181,166,159,155)
   hist(height,main="histogram of height")
   
#pie()함수
   
   #(1)기본적인 pie chart
   par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
   p1 <-c(10,20,30,40)
   pie(p1,radius=1)
   
   #(2)시작 각도 90도로 지정
   pie(p1,radius=1,init.angle=90)
  
   #(3) 색깔과 label 명을 지정하기
   pie(p1,radius=1,init.angle=90,
       col=rainbow(length(p1)),
       label=c("Week1","Week2","Week3","Week4"))
   
   #(4) 수치 값을 함께 출력하기(+범례)
   pct <- round(p1/sum(p1) *100,1)
   lab <- paste(pct, " %")
   pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)), label=lab)
   legend(1,1.1,c("Week 1","Week 2","Week3","Week4"),
          cex=0.5, fill=rainbow(length(p1)))   
   
   #(5) 범례를 생략하고 그래프에 바로 출력하기
   pct <- round(p1/sum(p1) *100,1)
   lab1 <- c("Week 1","Week 2","Week 3","Week 4")
   lab2 <- paste(lab1,"\n",pct," %")
   pie(p1,radius=1, init.angle=90,col=rainbow(length(p1)),label=lab2) 
   