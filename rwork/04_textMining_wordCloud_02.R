#힙합 가사 텍스트 마이닝


  #패키지 설치
  install.packages("rJava")
  install.packages("memoise")
  install.packages("KoNLP")
  install.packages("dplyr")
  
  # Java폴더 경로 설정
  
  Sys.setenv(JAVA_HOME ="C:/Program Files/Java/jre1.8.0_161")
  
  
  #패키지 로딩
  
  library(KoNLP)
  library(dplyr)
  
  
  #사전 설정
  
  useNIADic() 

  #데이터 불러오기
  txt <-readLines("data/hiphop.txt")  
  txt <-readLines(file.choose())
  
  txt
  head(txt)     #기본:상위 6행 출력
  head(txt,35)  #상위 35행까지 출력
  
  #특수문자 제거
  install.packages("stringr")
  library(stringr)
  
  txt <- str_replace_all(txt,"\\W"," ") #특수 문자 제거
  txt  
  
  #가사에서 명사 추출
  nouns <-extractNoun(txt)
  nouns  
  
  #추출한 명사 list를 벡터로 변환 단어별 빈도표 생성
  wordcount <-table(unlist(nouns))
  wordcount
  
  #데이터 프레임으로 변환
  df_word <-as.data.frame(wordcount,stringsAsFactors =F)
  df_word
  
  #변수명 수정 rename() --dplyr패키지
  df_word <-rename(df_word, word=Var1,   # Var1 -> word
                            freq =Freq ) # Freq -> freq
  
  #두 글자이상 단어만 추출 :filter()  -dplyr패키지
  df_word <-filter(df_word,nchar(word) >=2)
  
  #빈도 순으로 정렬한 후 상위 20단어 추출
  df_word <- df_word %>%
             arrange(desc(freq)) %>% 
             head(20)
  df_word
  
  
  install.packages("wordcloud")
  
  #패키지로드
  library(wordcloud)
  library(RColorBrewer)
  
  pal <-brewer.pal(8,"Dark2")
  
  #난수고정
  set.seed(1234)
  
  wordcloud(word = df_word$word,  # 단어
            freq = df_word$freq,  # frequency
            min.freq = 2, # 최소 단어 빈도
            max.words=200, # 표현 단어 수
            random.order=F, # 고빈도 단어 중앙 배치
            rot.per=.1, # 회전된 단어 비율
            scale= c(4,0.3), # 단어 크기 범위
            color=pal  # 색상 목록
            )
  

  #색상 변경
  
  pal <-brewer.pal(9,"Blues") [4:9]
  set.seed(1234)  
  wordcloud(word = df_word$word,  # 단어
            freq = df_word$freq,  # frequency
            min.freq = 2, # 최소 단어 빈도
            max.words=200, # 표현 단어 수
            random.order=F, # 고빈도 단어 중앙 배치
            rot.per=.1, # 회전된 단어 비율
            scale= c(4,0.3), # 단어 크기 범위
            color=pal  # 색상 목록
  )
  