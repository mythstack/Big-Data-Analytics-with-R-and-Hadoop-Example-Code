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

## Laoding the RHadoop libraries
library('rhdfs')
library('rmr2')

## Initializaing the RHadoop 
hdfs.init()


# Defining wordcount MapReduce function
wordcount = function(input, 
                     output = NULL, 
                     pattern = " "){

# Defining wordcount Map function					 
wc.map = function(., lines) {
           keyval(
             unlist(strsplit(
                 x = lines,
                 split = pattern)),
          1)}


# Defining wordcount Reduce function
wc.reduce = function(word, counts ) {
                     keyval(word, sum(counts))}

# Defining MapReduce parameters by calling mapreduce function					 
mapreduce(input = input ,
          output = output,
          input.format = "text",
          map = wc.map,
          reduce = wc.reduce,
          combine = T)}

		  
# Running MapReduce Job by passing the Hadoop input directory location as parameter 		  
wordcount('/RHadoop/1/')

# Retrieving the RHadoop MapReduce output data by passing output directory location as parameter
from.dfs("/tmp/RtmpRMIXzb/file2bda5e10e25f")
