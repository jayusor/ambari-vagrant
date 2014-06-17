rm(list=ls());gc()

Sys.getenv("HADOOP_CMD")
Sys.setenv("HADOOP_CMD"="/usr/bin/hadoop")
Sys.setenv("HADOOP_STREAMING"="/usr/lib/hadoop-mapreduce/hadoop-streaming.jar")
Sys.setenv("JAVA_HOME"="/usr/jdk64/jdk1.7.0_45")

library(rJava)

library(rmr2)
library(rhdfs)

hdfs.init()

ints = to.dfs(1:100)
calc = mapreduce(input = ints,map = function(k, v) cbind(v, 2*v))

from.dfs(calc)

hdfs.rm("/user/jorge/prueba")




writeLines(as.character(iris$Species),"prueba.txt")


library(rmr2) 

## map function
map <- function(k,lines) {
  words.list <- strsplit(lines, '\\s') 
  words <- unlist(words.list)
  return( keyval(words, 1) )
}

## reduce function
reduce <- function(word, counts) { 
  keyval(word, sum(counts))
}

wordcount <- function (input, output=NULL) { 
  mapreduce(input=input, output=output, input.format="text", 
            map=map, reduce=reduce)
}

## Submit job
hdfs.root <- 'wordcount'
hdfs.data <- file.path(hdfs.root, 'data') 
hdfs.out <- file.path(hdfs.root, 'out') 


## delete previous result if any
hdfs.mkdir(hdfs.root)
hdfs.mkdir(hdfs.data)
hdfs.mkdir(hdfs.out)


system("hadoop fs -rm -r wordcount/out")
system("hadoop fs -ls /user/jorge")

out <- wordcount(hdfs.data, hdfs.out)

## Fetch results from HDFS
results <- from.dfs(out)

## check top 30 frequent words
results.df <- as.data.frame(results, stringsAsFactors=F) 
colnames(results.df) <- c('word', 'count') 
head(results.df[order(results.df$count, decreasing=T), ], 30)
