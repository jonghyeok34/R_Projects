#데이터 프레임



# 두 명의 고객 정보에 대한 데이터 프레임 만들기
x <- data.frame(성명=c("홍길동", "손오공"),
                  나이=c(20, 30), 
                  주소=c("서울", "부산"))
x

# 동일한 결과
x  <- data.frame("성명"=c("홍길동","손오공"),
                 "나이"=c(20,30),
                 "주소"=c("서울","부산"))
x


# 열과 행 단위 추가
#데이터 프레임 x에 열(학과) 추가	
x <-cbind(x,"학과"=c("e-비즈니스","경영"))
x



#데이터 프레임 x에 행(장발장) 추가
x <-rbind(x, data.frame(성명 = "장발장",
                          나이 =40, 
                          주소="파리",
                          학과 ="행정"))
x

#요소 값 보기
x[3,2] #x의 3행 2열의 값

x[3,] #3행의 모든 값
x[,2] #2열의 모든 값
x[,-2] #2열을 제외한 모든 값
x[-2,] #2행을 제외한 모든 값


x["성명"]

x$성명

x[["성명"]]

x[[1]] #1열 요소

x[[1]][2]  #1열 요소의 2번째 값

x[1,2] <-21 #1열 요소의 값에서 두번째 값

x[1,"나이"] <- 22 #1열 요소에서 '나이' 행 --> 22로 변경




#제어문

#TRUE , FALSE는 대문자로 입력해야

if(TRUE){
  print("Hello World")
}
if(FALSE){
  pring("Hello World")
}

if(20 > 10) {		# 조건식이 참이 경우에만 실행됨		
  print("Hello world")  		
}

if(10>=0){
  print("10은 양수")
}else{
  print("10은 음수")
}

abs <-function(a){
  if(a<0){
    return (-a)
  }else{
    return (a)
  }
}

abs(-30)

#ifelse(a,b,c)
a<-10
ifelse(a%%2==0 , "짝수","홀수")

#if ~ else if

funif <-function(a){
  if(a<0) return(0)
  else if (a>=1 && a<=5) return(1)
  else return(10)
}

funif(3)

#반복문
#for문
for(i in 1:10){
  print ("사랑해요")
}

#1~10까지 합
sum<-0
for(i in 1:10){
  sum <-sum+i
}
sum
#1~100까지 홀, 짝수의 합 구하기
oddsum <-0
evensum <-0

for(i in 1:100){
  if(i%%2 == 0)
    evensum=evensum+i
  else
    oddsum=oddsum+i
}
oddsum
evensum

#while문
i<-1
while(i<=10){
  print("사랑해요")
  i<-i+1;
  
}

i<-1
oddsum <-0
evensum <-0
while(i<=100){
  if(i%%2==0){
    evensum= evensum+i
  }else{
    oddsum= oddsum+i
  }
  i<-i+1
}
oddsum
evensum      

