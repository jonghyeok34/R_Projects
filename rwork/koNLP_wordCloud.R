
setwd("C:/Users/Administrator/Dropbox/rwork/rpro")


#http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know 



#데이터 마이닝 & wordcloud

  #예1
  #step2. 필요한 패키지를 설치한 후 R에 load
  
  install.packages("KoNLP")
  install.packages("wordcloud")  
  
  library(KoNLP)
  library(wordcloud)  
  
  txt <-readLines("data/hong.txt")
  txt
  
  #step4. 데이터 중에서 명사만 골라낸 후 nouns 변수에  할당
  #gsub - 제거할 글자 지정
  txt <-gsub("저","",txt) 
  txt <-gsub("수","",txt)
  txt <-gsub("들","",txt)
    
  nouns <-sapply(txt,extractNoun,USE.NAMES = F)
  
  
  #step 5. 추출된 명사를 상위 30개만 출력해서 확인
  head(unlist(nouns),30)
  
  #Step 6. 파일에 저장해 둡니다. 
  write(unlist(nouns),"data/hong_2.txt")
  
  #Step 7. 수정 완료된 파일을 다시 table 형식으로 변환해서 변수에 불러들입니다
  rev <- read.table("data/hong_2.txt")

    #Step 8. 화면에 그래픽으로 출력하기 전에 text 형태로 결과를 확인해 봅니다
  nrow(rev)
  wordcount <-table(rev)    
  wordcount
  
  head(sort(wordcount,decreasing=T),30)
  
  #Step 9. Word Cloud 형태로 그래픽으로 출력합니다
  library(RColorBrewer) #화면에 출력할 컬러 사용할 library load
  palate <-brewer.pal(9,"Set1") #글자 색깔 지정  
  
  
  wordcloud(names(wordcount),freq=wordcount, scale=c(5,0.5),rot.per=0.25,min.freq=2,random.order=F,random.color=T, colors =palate)
  
  #Step 10 png로 저장 -- rstudio에서는 plots --> export하면 됨.
  savePlot("hont.png",type="png") 
  