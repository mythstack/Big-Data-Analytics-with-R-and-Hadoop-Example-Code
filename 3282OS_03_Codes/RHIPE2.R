================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 3 Integrating R and Hadoop 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

## Set these environment variables before executing the codes
Sys.setenv(HADOOP_HOME="/usr/local/hadoop/")
Sys.setenv(HADOOP_BIN="/usr/local/hadoop/bin")
Sys.setenv(HADOOP_CONF_DIR="/usr/local/hadoop/conf")

## Loading the RHIPE Library
library(Rhipe) 

rhput('/usr/local/hadoop/CHANGES.txt','/RHIPE/input/')
## Defining the Map function
w_map<-expression({ 
words_vector<-unlist(strsplit(unlist(map.values)," ")) 
lapply(words_vector,function(i) rhcollect(i,1)) 
}) 


## For reference, RHIPE provides a canned version
Reduce = rhoptions()$templates$scalarsummer

## Defining the Reduce function
 w_reduce<-expression( 
pre={total=0}, 
reduce={total<-sum(total,unlist(reduce.values))}, 
post={rhcollect(reduce.key,total)} 
) 
 
## Defining and executing a MapReduce job object 
Job1 <- rhwatch(map=w_map,reduce=w_reduce, 
		input='/RHIPE/input/',
		output='/RHIPE/output/', 
		jobname="word_count")

## Reading the job output data from HDFS		
Output_data <- rhread(Job1)

## Displaying the MapReduce output in  data frame format.
results <- data.frame(words=unlist(lapply(Output_datae,'[[',1)),
                      count =unlist(lapply(Output_datae,'[[',2)))