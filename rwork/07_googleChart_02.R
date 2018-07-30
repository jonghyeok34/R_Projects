
setwd("C:/Users/Administrator/Dropbox/rwork")

#google chart
  install.packages("googleVis")
  library(googleVis)
  fruits = data.frame(month=c("JAN","FEB","MAR"),
                      apple=c(30,10,20),
                      orange=c(20,40,30))
  
  line <- gvisLineChart(fruits)
  plot(line)
  
  
  line2 <-gvisLineChart(fruits,"month",
                        c("apple","orange"),
                        option=list(series ="[{targetAxisIndex:0}
                                            ,{targetAxisIndex:1}]", 
                                    vAxes="[{title:'apple'},{title:'orange'}]"))
  plot(line2)


#google bar chart
  gbar <- gvisBarChart(fruits)
  plot(gbar)
  
  
#google pie chart
  
  #e.g. 1)
  install.packages("googleVis")
  library(googleVis)
  CityPopularity
  pie1 <-gvisPieChart(CityPopularity,
                      options =list(width=400, height=300)) 
  plot(pie1)  
  
  #e.g. 2)
  pie2 <-gvisPieChart(CityPopularity,
                      options=list(slices="{4:{offset:'0,2'}, 0:{offset:'0.3'}}",
                                   title="City popluarity",
                                   legend="none",
                                   pieSliceText="label",
                                   pieHole="0.5",width=600))
  
  plot(pie2)
  
#Google Candle Stick chart
  
  OpenClose
  
  candle <-gvisCandlestickChart(OpenClose,
                                options=list(legend='none',
                                             height=400,
                                             width=500))  
  plot(candle)
  
  Fruits
  a <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales",
                       yvar="Expenses",
                       colorvar="Year", sizevar="Profit",
                       options=list(height=500,weight=800,
                                    hAxis='{minValue:75, maxValue:125}'))
  plot(a)
   
  
  #Google Column Chart 
  korean <-read.csv("data/07_googleChart/학생별회차별성적__국어_new.csv",header=T)
  korean
  kor <-gvisColumnChart(korean,
                        options=list(title="학생별 성적비교",
                                     height=400,weight=500))  
  plot(kor)  
  
  
  
  #google Area Chart
  
  korean <-read.csv("data/07_googleChart/학생별회차별성적__국어_new.csv",header=T)
  korean

  area <-gvisAreaChart(korean,
                       options=list(height=400, weight=500))  
  plot(area)
  
  
  
  #Google Combo Chart
  
  korean <- read.csv("data/07_googleChart/학생별회차별성적__국어_new.csv", header=T)
  korean
  
  combo <-gvisComboChart(korean,
                         options=list(seriesType="bars",
                                      height=400, weight=500,
                                      series='{3:{type:"line"}}'))
  
  #OrgChart
  
  name <- c('Angela Bassett','Jessica Lange','Winona Ryder','Michelle Pfeiffer',
            'Whoopi Goldberg','Emma Thompson','Julia Roberts','Sharon Stone','Meryl Streep',
            'Susan Sarandon','Nicole Kidman')
  pemp <- c(NA,'Angela Bassett','Jessica Lange','Winona Ryder','Winona Ryder',
              'Angela Bassett','Emma Thompson', 'Julia Roberts','Angela Bassett',
            
              'Meryl Streep','Susan Sarandon')
  pay <- c(100,200,300,400,500,600,700,800,900,1000,1100)
  emp <- data.frame(NAME=name, PNAME =pemp, PAY=pay)
  Org <- gvisOrgChart(emp, idvar="NAME", parentvar = "PNAME",
                      options=list(width=600, height=250,
                                   size='middle',
                                   allowCollapse=T))  
  plot(Org)

  #Annotation Chart  
  Stock
  achart <- gvisAnnotationChart(Stock,datevar="Date",
                                numvar="Value",idvar="Device",
                                titlevar="Title",
                                annotationvar="Annotation",
                                options=list(width=1000,
                                             height=500,
                                             fill=10,
                                             displayExactValues=T,
                                             colors="['red','blue']"))

  plot(achart)  
  
  
  #Time line graph
  
  dat <-data.frame(Term=c("1","2","3"),
                   President =c("Washington","Adams","Jefferson"),
                   start=as.Date(x=c("1789-03-29","1797-02-03","1801-02-03")),
                   end=as.Date(x=c("1797-02-03","1801-02-03","1809-02-03")))
  tl <-gvisTimeline(data=dat[,-1],rowlabel="President",
                    start="start",end ="end")  
  
  tl <-gvisTimeline(data=dat,barlabel="President",
                    start="start",end ="end")  
  
  plot(tl)  
  
  #Scatter Chart
 
  txt1 <-gvisScatterChart(women)
  plot(txt1)  
  
  
  #TreeMap
  
    #TreeMap 사용하기
    Regions
    tm <-gvisTreeMap(Regions,idvar="Region",parentvar="Parent",
                     sizevar="Val",colorvar="Fac")
    
    plot(tm)  
    
    #미국전체 주를 TreeMap으로
    require(datasets)
    states$state
    states <-data.frame(state.name,state.area)    
    
    total = data.frame(state.area=sum(states$state.area),
                       state.name="USA")
    
    my.states <-rbind(total,states)
    my.states$parent ="USA"

    my.states$parent[my.states$state.name=="USA"] <-NA    
    my.states$state.area.log =log(my.states$state.area)
  
    
    statesTree <-gvisTreeMap(my.states, "state.name","parent",
                             "state.area","state.area.log")    
    
    plot(statesTree)
    
  #gvisMerge()
    
    #2개 googleChart 합치
    Geo <-gvisGeoChart(Exports, "Country","Profit",
                       options=list(width=250, height=100))
    
    Tbl <-gvisTable(Exports,
                    options =list(width=250, height=300))    
    GT <-gvisMerge(Geo,Tbl, horizontal=F) 
    
    plot(GT)
    
    #3개 googleChart 합치기
    M <- gvisMotionChart(Fruits, "Fruit", "Year",
                         options=list(width=400, height=410)) 
   
    GTM <-gvisMerge(GT, M, horizontal=T,
                    tableOptions = "cellspacing=10")    
    plot(GTM)    
    
    
   
    #4개 GoogleChart 합치기
    
    line   <- gvisLineChart(OpenClose, "Weekday", c("Open", "Close"),
                            options=list(legend="none", width=300, height=150))
    column <- gvisColumnChart(OpenClose, "Weekday", c("Open", "Close"),
                                options=list(legend="none", width=300, height=150))
    area   <- gvisAreaChart(OpenClose, "Weekday", c("Open", "Close"),
                            options=list(legend="none", width=300, height=150))
    bar    <- gvisBarChart(OpenClose, "Weekday", c("Open", "Close"),
                          options=list(legend="none", width=300, height=150))
    lcab   <- gvisMerge(gvisMerge(line, column), gvisMerge(area, bar),
                        horizontal=TRUE, tableOptions="bgcolor=\"#AABBCC\"")
    plot(lcab)
    
  #Sankey chart
    
    data1 <- read.csv("data/07_googleChart/영화배우와_출연작품.csv")
    data1    
    
    plot(gvisSankey(data1,from="배우명",to="영화명",
                    weight="관객수",
                    options=list(height=550, width=800,
                                 sankey="{link:{color:{fill:'lightblue'}}}")))
    