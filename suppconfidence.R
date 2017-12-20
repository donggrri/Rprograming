
getwd()
setwd("D:/Util/0java/Bigdata/R??????")
source("getnavernews.R",encoding = "UTF-8")

install.packages("arules")
install.packages("igraph")
install.packages("combinat")
library(arules)
library(igraph)
library(combinat)
library(KoNLP)
install.packages("rJava")
library(rJava)

rule <- file("1220.csv")
rules <- readLines(rule)
head(rules)

tran <- Map(extractNoun, rules)
tran
tran <- unique(tran)
tran <- sapply(tran, unique)
tran
tran <- sapply(tran, function(x){Filter(function(y) {nchar(y)<=4 && nchar(y)>1 && is.hangul(y)}, x)})
tran
###
names(tran) <- paste("Tr",1:length(tran),sep="")
names(tran)
wordtran <- as(tran,"transactions")
wordtran

wordtab <- crossTable(wordtran)
head(wordtab)

ares <- apriori(wordtran, parameter=list(supp=0.003, conf=0.003)) #??Ȳ?? ?°? ????
inspect(ares)

rules <- labels(ares,ruleSep=" ")
rules <- sapply(rules,strsplit," ",USE.NAMES = F)
rulemat <- do.call("rbind",rules)
rulemat

ruleg <- graph.edgelist(rulemat[-c(1:38),],directed = F)

plot.igraph(ruleg, vertex.label=V(ruleg)$name,vertex.label.cex=1,
            vertex.size=30, layout=layout.fruchterman.reingold.grid)
