# <<reading>>

  #scan() function example
  
    #call file
  
    s1 <-scan("scan_1.txt","r")
    s1  
    
    #input number with keyboard
    
    input <-scan()  
    input
    input[1] 
    
    #input characters with keyboard
    input2 <-scan(what="") #to input chars put what(if it isn't --> error)
    input2
    
    
  #readline() : <function> read inputs /line 
    
    input3 <-readline()
    input3
    
    input4 <-readline("Are you ok?") #print "Are you ok?" on console, then get input 
    input4  
  
  #readLines(): <function> read data from file and make array
    
    input5 <-readLines('scan_4.txt')
    input5    
  
  #read.table() : read file and make it into dataframe
    fruits <- read.table('fruits.txt')
    fruits
    
    #add head
    fruits <-read.table('fruits.txt',header='T')
    fruits
    
    # skip=n , n=lines to skip
    fruits <-read.table('fruits.txt',skip=2)
    fruits
    
    #nrows =n , rows for print out
    fruits2 <-read.table('fruits.txt', nrows=2)
    fruits2  
      
    #read.csv(): read csv file
      fruits3 <-read.csv('fruits_3.csv')
      fruits3  
      #read excel
      install.packages("readxl")
      library(readxl)    
      data1<-read_excel("fruits_6.xls")    
      data1<-read_excel("fruits_6.xls",sheet=1,
                        col_names = TRUE,
                        col_types = FALSE
                        ,na="",skip=1
                        
      )    
      
      data1  
# <<writing>>
    
    #write.table(): save dataframe as file
      
      #dataframe(fruits3) to fruits.txt
      write.table(fruits3, 'fruits3.txt')
        
    
    #install.packages("WriteXLS")
      # writeXLS 패키지, 윈도우 운영체제에 Perl저장되어야함.
      install.packages("WriteXLS")
      library(WriteXLS)  
      
      name <-c("Apple","Banana","Peach")
      price <-c(300,200,100)
      item <-data.frame(Name=name,Price=price)
      item
    
      writeXLS(item,"item.xls")      
      
      
  #xml파일로 저장
      
      #패키지 설치
      install.packages("XML")
      install.packages("kulife")
      
      #패키지 로딩
      library(XML)
      library(kulife)      
      
      name <-c("Apple","Banana","Peach")
      price <-c(300,200,100)
      item <-data.frame(Name=name,Price=price)
      item
    
      #write.xml()  
      write.xml(item,"item.xml")
      
    