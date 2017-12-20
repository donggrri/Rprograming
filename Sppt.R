data = read.csv(file.choose(),header = T)
data
head(data)
a1 # 아직 attatch  안함 => 출력안됨
attach(data)
a1 # attach 하면 출력됨
table(a1)
table(Gender)

#전체를 놓고 변수만 지워나가는 식으로
# a35~a55 까지 
test <- subset(data,select =c("a35","a36","a37","a38","a39","a40","a41","a42","a43","a44","a45",
                              "a46","a47","a48","a49","a50","a51","a52","a53","a54","a55") )
test2 <- subset(data,select =c("a35","a36","a37","a38","a40","a41","a42","a43","a44","a45",
                              "a46","a47","a48","a49","a50","a51","a52","a53","a54","a55") )

test2 <- subset(data,select =c("a17","a18","a19","a20","a21","a22","a23","a24","a25","a26",
                               "a27","a28","a29","a31","a32","a33","a34") )

test2
test
head(test)
fit <- factanal(test,factors = 5,rotation ="varimax") #factor 5개 , varimax 로 보이게 , 0.1이상인게 나옴
fit

fit2 <- factanal(test,factors = 5,rotation = "varimax") 
print(fit2,cutoff=0.4,digit=3)

fit2 <- factanal(test2,factors = 3,rotation = "varimax") 
print(fit2,cutoff=0.4,digit=3) # 예측도 0.4 예측도가 높을수록 정확함.
e_value = eigen(cor(test))
e_value


#종속변수 -> 우리가 예측하고싶은변수 ex)날씨 독립변수 -> 종속변수를 설명해주는 변
