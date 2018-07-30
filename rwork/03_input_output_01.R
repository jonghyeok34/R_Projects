#함수 

factorial(170)

(c<-b+100) #괄호로 감싸면 값 즉시 확인

round (3.4567,2)
?round #round 설명하기

fun1 <- function(){
  return(50)
}
fun1

fun2 <- function(y){
  return(y^2)
}
fun2(3)

ls()


var1 <-c(1,2,5,7,8)
var1

var2 <-c(1:5)
var2


#seq()

var3 <- seq(1, 5) # 1~5 까지 연속값으로 var3 생성
var3

var4 <- seq(1, 10, by = 2) # 1~10 까지 2 간격 연속값으로 var4 생성
var4

var5 <- seq(1, 10, by = 3) # 1~10 까지 3 간격 
var5

str1 <-"a"

str1+2 #문자 변수 + 숫자 데이터 --> 불

str4 <-c("a","b","c")

str5 <- c("Hello","World","is","Good")
str5



#숫자 다루는 함수
x<-c(1,2,3)
mean(x)

#문자 다루는 함수

#쉼표를 구분자로 str5의 단어들 하나로 합치기
paste(str5,collapse =",")
paste(str5,collapse =" ")



#Package(패키지)- 함수 꾸러미 이용하기

#ggplot2 패키지 설치
install.packages("ggplot2")

#ggplot2패키지 로딩
library(ggplot2)

#여러 문자로 구성된 변수 생성
x<-c("a","a","b","c")

#막대 그래프 출력
qplot(x)


#Dataframe이용하기

#벡터 합치기

#영어 점수
english <- c(90,80,60,70)

#수학 점수
math <- c(50,60,100,20)


df_midterm <-data.frame(english,math)    
df_midterm

#class 
class <-c(1,1,2,2)
class

df_midterm <-data.frame(english,math,class)    
df_midterm      

mean(df_midterm$english) #english컬럼의 평균 산출
mean(df_midterm$math)  #수학 컬럼의 평균 산출

#한번에 만들기

df_midterm <-data.frame(english= c(90,80,60,70),
                        math= c(50,60,100,20),
                        class = c(1,1,2,2))
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

max(df_midterm$english)
max(df_midterm$math)

min(df_midterm$english)
min(df_midterm$math)



#패키지(read xl)

#설치
install.packages("readxl")

#패키지 로드
library(readxl)

#엑셀 부르기
df_exam <-read_excel("excel_exam.xlsx")
#같은 디렉토리 안에 있을 경우 디렉토리 생략 가능
#디렉토리 위치가 다를 경우 절대 경로 위치로 불러

df_exam      

#평균 점수 구하기
mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

#엑셀 파일 첫 번쨰 행이 변수명이 아니라면

df_exam_novar <-read_excel(("excel_exam_novar.xlsx"),
                           col_names= F) #col_names --> F(False)

#엑셀 파일에 시트가 여러개라면

df_exam_sheet <-read_excel(("excel_exam_sheet.xlsx"),
                           sheet=3) 
df_exam_sheet


#csv파일 불러오기 (따로 패키지 필요 x)
df_csv_exam <-read.csv("csv_exam.csv")
df_csv_exam


#csv파일로 저장하기
df_midterm <-data.frame(english= c(90,80,60,70),
                        math= c(50,60,100,20),
                        class = c(1,1,2,2))
df_midterm

write.csv(df_midterm,file="write_midterm")
