setwd("C:/Users/Administrator/Dropbox/rwork")

#구글 차트
  install.packages("googleVis")
  library(googleVis)
  
  #과일 출력 예제
  Fruits
  Fruits1 <- gvisMotionChart(Fruits,idvar="Fruit",timevar="Year")
  plot(Fruits1) #browser에 출력

  
  
  #서울 지하철 2호선 강남역 시간대별 승하차 현황
  
  line_2 <-read.csv("./data/07_googleChart/2호선_강남역_시간대별_승하차현황_세로.csv",
                    header=T,
                    sep=",")
  
  t1<-gvisMotionChart(line_2, idvar ="line_no",timevar="time",
                      options=list(width=1000,height=500))
  plot(t1)

  
  #GoogleMap상에 storm의 이동경로를 표시
  
  data("Andrew")
  Andrew
  storm1 <-gvisMap(Andrew,"LatLong","Tip",
                   options=list(showTip=T,
                                showLine=T,
                                enableScrollWheel=T,
                                mapType='hybrid',
                                useMapTypeControl=T,
                                width=800,
                                height=400))  
  plot(storm1)  

  
  # GoogleMap에 서울시 구청 위치 표시
  loc <- read.csv("./data/07_googleChart/서울시구청위치정보_new.csv",header=T)
  loc  
  
  hoffice <-gvisMap(loc,"LATLON","name",
                    options=list(showTip=TRUE,
                                 showLine=TRUE,
                                 enableScrollWheel=TRUE,
                                 mapType='normal',
                                 useMapTypeControl=TRUE,
                                 width=1000,
                                 height=400))  
  plot(hoffice)  
  