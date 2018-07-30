#Connect MySQL with R

  #1.install RJDBC package
  install.packages("RJDBC")
  
  #2. load package
  library(RJDBC)
  
  #3. set Driver
  jdbcDriver <-JDBC(driverClass="com.mysql.jdbc.Driver",
                    classPath="/jar/mysql-connector-java-5.1.35-bin.jar")
  
  #4. connect db
  conn <- dbConnect(jdbcDriver,
                    "jdbc:mysql://localhost:3306/jsptest",
                    "jspid",
                    "jsppass")
  
  #5.make query
  myquery <-"select * from mem"
  
  #6.execute query and save into r
  r <- dbGetQuery(conn,myquery);
  r


#Connect MongoDB with R
  
  #e.g. 1)
    
    #1.install MongoDB package for R
    install.packages("mongolite")
    
    #2.Load package
    library(mongolite)
    
    #3.Connect to MongoDB(collection, db)
    con<-mongolite::mongo(collection = "books",
                          db="local",
                          url="mongodb://localhost")

    #4. get count of data of dataframe
    num <- con$count()
    num
    
    #5. find books collection data from local(db)
    df <-con$find(query='{}')
    df
    head(df)
    
  #e.g. 2)
    
    #1.install MongoDB package for R
    install.packages("mongolite")
    
    #2.Load package
    library(mongolite)
    
    #3.Connect to MongoDB(collection, db)
    con<-mongolite::mongo(collection = "baseball",
                          db="test",
                          url="mongodb://localhost")
    
    #4.read Batting.csv
    df <- read.csv("C:/Users/Administrator/Dropbox/rwork/data/Batting.csv")
    df
    
    #5.Document를 baseball collection에 저장
    con$insert(df)
    
    #6.count dataframe
    num <-con$count()
    num        
    
    #7.search baseball collection of test db
    df <- con$find(query='{}')
    df
    head(df)
    
    #8.serach data where yearId is greater than 1999
    df <- con$find(query='{"yearID":{"$gt":1999}}')
    head(df)
        