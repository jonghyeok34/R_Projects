#한글처리 패키지 설치
install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages("wordcloud")

#한글처리 패키지 로딩
library(KoNLP)
library(RColorBrewer)
library(wordcloud)

#한글 ‘세종사전‘ 로딩
useSejongDic()

#팔레트 생성
pal2 <-brewer.pal(8,"Dark2")

#연설문파일 읽어오기
text<-readLines(file.choose())
text        #연설문 확인

#파일의 각 행에서 명사만 추출
noun <- sapply(text,extractNoun, USE.NAMES=F)
noun

#추출된 명사 통합
noun2 <-unlist(noun)
noun2

#단어별 빈도수 계산
word_count <-table(noun2)
word_count

#단어 빈도를 내림차순으로 정렬해서 앞부분 10개보기
head(sort(word_count, decreasing =TRUE),30)

#wordcloud 
set.seed(2)

#워드클라우드 출력
wordcloud(names(word_count),
          freq=word_count,
          scale=c(10,0.5),
          min.freq = 3,
          random.order = F,
          rot.per =.1,
          colors=pal2)

