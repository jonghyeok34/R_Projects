
# 도시(서울) 중심의 지도 출력
# ggmap 패키지 설치 및 로딩 
install.packages("ggmap")
library(ggmap)딩

#한글 지역명을 utf8형식으로 변환해서 위도와 경도 반환 
gc <- geocode(enc2utf8('평창'))

#위도와 경도를 숫자형식으로 변환 
cen <- as.numeric(gc)

#위도와 경도를 중심으로 하는 지도정보 반환 
map <- get_googlemap(center=cen, , maptype="roadmap")

#지도 출력
ggmap(map)


#-------------------------------------------------------


#구글차트 - MotionChart
install.packages("googleVis")
library(googleVis)
Fruits
Fruits1<- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(Fruits1)



#서울 지하철 2호선 강남역 시간대별 이용현황수 
library(googleVis)
line_2 <- read.csv("2호선_강남역_시간대별_승하차현황_세로.csv",header=T,sep=",")
t1 <- gvisMotionChart(line_2, idvar="line_no", timevar="time", options=list(width=1000,height=500))
plot(t1)



#GoogleMap
install.packages("googleVis")
library(googleVis)
data(Andrew)
Andrew
storm1 <- gvisMap(Andrew, "LatLong" , "Tip",
                  options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
                  mapType='hybrid', useMapTypeControl=TRUE, width=800,height=400))
plot(storm1)




#서울시구청위치정보 출력 
install.packages("googleVis")
library(googleVis)
loc <- read.csv("서울시구청위치정보_new.csv",header=T)
loc
hoffice <- gvisMap(loc, "LATLON" , "name",
                    options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
                    mapType='normal', useMapTypeControl=TRUE, width=1000,height=400))
plot(hoffice)





#예.Google Gauge Chart 로 실적을 표시
library(googleVis)
CityPopularity
ex1 <-gvisGauge(CityPopularity, options=list(min=0, max=800, greenFrom=500, greenTo=800, 
                yellowFrom=300, yellowTo=500, redFrom=0, redTo=300, width=400, height=300))
plot(ex1)



#예. Google Line Chart 사용하기
install.packages("googleVis")
library(googleVis)
fruits=data.frame(month=c("JAN","FEB","MAR"),
                  apple=c(30,10,20), orange=c(20,40,30))
line <- gvisLineChart(fruits)
plot(line)


line2 <- gvisLineChart(fruits,"month",c("apple","orange"),
                       option=list(series="[{targetAxisIndex:0}, {targetAxisIndex:1}]",
                                   vAxes="[{title:'apple'},{title:'orange'}]" ))
plot(line2)


line3 <- gvisLineChart(fruits,xvar="month",yvar=c("apple","orange"),
                         options=list(series="[{color:'blue',targetAxisIndex:0,
                                  linewidth:1,lineDashStyle:[1,10,1,10,1,10]},
                                 {color:'red',targetAxisIndex:1,
                                  linewidth:2,lineDashStyle:[4,1]}]",
                        vAxes="[{title:'apple'},{title:'orange'}]" ))
plot(line3)




#예. Google Bar Chart 사용하기
gbar <- gvisBarChart(fruits)
plot(gbar)




#예. Google Pie Chart 사용하기
install.packages("googleVis")
library(googleVis)
CityPopularity
pie1 <- gvisPieChart(CityPopularity,options=list(width=400, height=300)) 
plot(pie1)


pie2 <- gvisPieChart(CityPopularity, options=list(
          slices="{4: {offset: '0.2'}, 0: {offset: '0.3'}}",
          title="City popularity",
          legend="none",
          pieSliceText="label",
          pieHole="0.5",width=600))
plot(pie2)




#예. Google Candle Stick Chart 사용하기
install.packages("googleVis")
library(googleVis)
OpenClose
candle <- gvisCandlestickChart(OpenClose, 
                               options=list(legend='none',height=400,width=500))
plot(candle)




#예. Google Bubble Chart 사용하기
install.packages("googleVis")
library(googleVis)
Fruits
a <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales", 
                       yvar="Expenses", 
                       colorvar="Year", sizevar="Profit", 
                       options=list(height=500,weight=800,
                       hAxis='{minValue:75, maxValue:125}'))
plot(a)




#예. Google Column Chart 사용하기
install.packages("googleVis")
library(googleVis)

korean <- read.csv("학생별회차별성적__국어_new.csv",header=T)
korean

kor <- gvisColumnChart(korean,options=list(title="학생별 성적비교",
                                           height=400,weight=500))
plot(kor)



#Google Area Chart 사용하기
install.packages("googleVis")
library(googleVis)
korean <- read.csv("학생별회차별성적_국어_new.csv",header=T)
korean

area <- gvisAreaChart(korean,options=list(height=400,weight=500 ))
plot(area)



#예. Google Combo Chart 사용하기
install.packages("googleVis")
library(googleVis)
korean <- read.csv("학생별회차별성적__국어_new.csv",header=T)
korean

combo <- gvisComboChart(korean,options=list(seriesType="bars", 
                                            height=400,weight=500,series='{3: {type:"line"}}'))
plot(combo)



#예.계층도 그리기 - gvisOrgChart 사용하기
name <- c('Angela Bassett','Jessica Lange','Winona Ryder','Michelle Pfeiffer',
            'Whoopi Goldberg','Emma Thompson','Julia Roberts','Sharon Stone','Meryl Streep',
            'Susan Sarandon','Nicole Kidman')

pemp <- c(NA,'Angela Bassett','Jessica Lange','Winona Ryder','Winona Ryder',
            'Angela Bassett','Emma Thompson', 'Julia Roberts','Angela Bassett',
            'Meryl Streep','Susan Sarandon')

pay <- c(100,200,300,400,500,600,700,800,900,1000,1100)
emp <- data.frame(NAME=name,PNAME=pemp, PAY=pay)
Org <- gvisOrgChart(emp,idvar="NAME",parentvar="PNAME",
                      options=list(width=600, height=250,size='middle', allowCollapse=TRUE))
plot(Org)



#예. 챠트에 주석 넣기- gvisAnnotationChart 사용
install.packages("googleVis")
library(googleVis)
Stock

achart <-         
  gvisAnnotationChart(Stock,datevar="Date",numvar="Value",idvar="Device",
                      titlevar="Title",annotationvar="Annotation",
                      options=list(width=1000,height=500,fill=10, displayExactValues=TRUE,
                      colors="['red','blue']"))
plot(achart)





#예. 타임라인 그래프 그리기
dat <- data.frame(Term=c("1","2","3"),
                  President=c("Whasington", "Adams", "Jefferson"),
                  start=as.Date(x=c("1789-03-29", "1797-02-03", "1801-02-03")),
                  end=as.Date(x=c("1797-02-03", "1801-02-03", "1809-02-03")))

tl <- gvisTimeline(data=dat[,-1], rowlabel="President",
                   start="start", end="end")
plot(tl)

tl <- gvisTimeline(data=dat, barlabel="President",
                     start="start", end="end")
plot(tl)




dat <- data.frame(Room=c("Class 1","Class 2","Class 3"),
                    Language=c("English Team", "German Team", "French Team"),
                    start=as.POSIXct(c("2015-09-14 14:00", "2015-09-14 15:00",
                                       "2015-09-14 14:30")),
                    end=as.POSIXct(c("2015-09-14 15:00", "2015-09-14 16:00",                
                                     "2015-09-14 15:30")))

tl <- gvisTimeline(data=dat, rowlabel="Rev_Team",
                     start="start", end="end")
plot(tl)





#예. gvisScatterChart 사용하기
install.packages("googleVis")
library(googleVis)
txt1 <- gvisScatterChart(women)
plot(txt1)


#예. gvisScatterChart 사용하기 (옵션 사용하기)
txt2 <- gvisScatterChart(women, options=list(legend="none",
                                               lineWidth="3", pointSize="3",
                                               title="Women", vAxis="{title:'weight (lbs)'}",
                                               crosshair="{ trigger: 'both' }",
                                           hAxis="{title:'height (in)'}", width=800, height=600))

plot(txt2)




#예. gvisScatterChart 사용하기 (포인터 모양 변경하기)
mtx <- matrix(nrow=6,ncol=6)
mtx[col(mtx)==row(mtx)] <- 1:6
dat <- data.frame(X=1:6, mtx)
sc <- gvisScatterChart(dat,
                         options=list(
                           title="Customizing points",
                           legend="right",
                           pointSize=30,
                           series="{
 		0: { pointShape: 'circle' },
 		1: { pointShape: 'triangle' },
 		2: { pointShape: 'square' },
 		3: { pointShape: 'diamond' },
 		4: { pointShape: 'star' },
 		5: { pointShape: 'polygon' }
 		}",width=800, height=400))
plot(sc)




#Treemap 사용하기 – gvisTreemap( )
install.packages("googleVis")
library(googleVis)
tm <- gvisTreeMap(Regions, idvar="Region", parentvar="Parent",
                    sizevar="Val", colorvar="Fac")
plot(tm)




#예. Treemap 사용하기 – gvisTreemap( )
#    [ 색상을 다르게 설정하기 ]
tm2 <- gvisTreeMap(Regions, "Region", "Parent", "Val", "Fac",
                   options=list(width=600, height=500,
                                fontSize=13,
                                minColor='#EDF8FB',
                                midColor='#66C2A4',
                                maxColor='#006D2C',
                                headerHeight=20,
                                fontColor='black',
                                showScale=TRUE))

plot(tm2)




#예. Treemap 사용하기 – gvisTreeMap( )
#[ 미국 전체 주를 Treemap 으로 표시하기 ]

require(datasets)
states <- data.frame(state.name, state.area)

total=data.frame(state.area=sum(states$state.area),     
                     state.name="USA")
my.states <- rbind(total, states)
my.states$parent="USA"
 
my.states$parent[my.states$state.name=="USA"] <- NA
my.states$state.area.log=log(my.states$state.area)

statesTree <- gvisTreeMap(my.states, "state.name", "parent",
                              "state.area", "state.area.log")
plot(statesTree)



#예. 여러 개(2개)의 Google Chart 합치기 – gvisMerge( ) 
Pie1 <- gvisPieChart(CityPopularity)
Pie2 <- gvisPieChart(CityPopularity, options=list(
                     slices="{4: {offset: '0.2'}, 0: {offset: '0.3'}}",
                     title="City popularity",
                     legend="none",
                     pieSliceText="label",
                     pieHole="0.5",width=600))

plot(gvisMerge(Pie2, Pie1, tableOptions = "cellspacing=\"20\" 
            bgcolor=\"#AABBCC\"", horizontal=TRUE))



#예. 여러 개(2개)의 Google Chart 합치기 – gvisMerge( ) 
Geo <- gvisGeoChart(Exports, "Country", "Profit",
                    options=list(width=250, height=100))

Tbl <- gvisTable(Exports,
                    options=list(width=250, height=300))
GT <- gvisMerge(Geo,Tbl, horizontal=FALSE)
plot(GT)



#예3. 여러 개(3개)의 Google Chart 합치기 – gvisMerge( ) 
M <- gvisMotionChart(Fruits, "Fruit", "Year",
                     options=list(width=400, height=410))

GTM <- gvisMerge(GT, M, horizontal=TRUE,
                   tableOptions="cellspacing=10")
plot(GTM)



#예4. 여러 개(4개)의 Google Chart 합치기 – gvisMerge( ) 
line <- gvisLineChart(OpenClose, "Weekday", c("Open", "Close"),
                      options=list(legend="none", width=300, height=150))
column <- gvisColumnChart(OpenClose, "Weekday", c("Open", "Close"),
                            options=list(legend="none", width=300, height=150))
area <- gvisAreaChart(OpenClose, "Weekday", c("Open", "Close"),
                        options=list(legend="none", width=300, height=150))
bar <- gvisBarChart(OpenClose, "Weekday", c("Open", "Close"),
                      options=list(legend="none", width=300, height=150))

lcab <- gvisMerge(gvisMerge(line, column), gvisMerge(area, bar),
                    horizontal=TRUE, tableOptions="bgcolor=\"#AABBCC\"")

plot(lcab)






#예. Sankey Chart 로 표현하기
data1 <- read.csv("영화배우와_출연작품.csv")
data1 
plot(  gvisSankey(data1, from="배우명", 
                    to="영화명", weight="관객수", 
                    options=list( height=550, width=800,
                                  sankey="{link:{color:{fill:'lightblue'}}}" 
                    )) 
    )









