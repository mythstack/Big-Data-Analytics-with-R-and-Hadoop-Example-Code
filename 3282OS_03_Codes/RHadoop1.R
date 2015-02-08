================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 3 Integrating R and Hadoop 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

## Required path for RHadoop
Sys.setenv(HADOOP_CMD="/usr/local/hadoop/bin/hadoop")
Sys.setenv(HADOOP_HOME="/usr/local/hadoop/")
Sys.setenv(HADOOP_STREAMING="/usr/local/hadoop/contrib/streaming/hadoop-streaming-1.1.0.jar")


## laoding the libraries
library('rhdfs')
library('rmr2')

## initializaing the RHadoop 
hdfs.init()

# defining the input data
small.ints = to.dfs(1:10)

## Defining the MapReduce job
mapreduce(
  input = small.ints, 
  map = function(k, v)
  {
lapply(seq_along(v), function(r){
  
  x <- runif(v[[r]])
    keyval(r,c(max(x),min(x))) 
  })})

## Update here the path parameter collected from last command output
output <- from.dfs('/tmp/RtmpRMIXzb/file2bda5ed5e3dd')

## Output in table format  
table_output<- do.call('rbind', lapply(output$val,"[[",2))
