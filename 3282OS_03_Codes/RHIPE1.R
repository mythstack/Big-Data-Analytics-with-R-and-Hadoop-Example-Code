================================================================================
Book - Big Data Analytics with R and Hadoop
Chapter - 3 Integrating R and Hadoop 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

## Set these environment variables before executing the codes
Sys.setenv(HADOOP_HOME="/usr/local/hadoop/")
Sys.setenv(HADOOP_BIN="/usr/local/hadoop/bin")
Sys.setenv(HADOOP_CONF_DIR="/usr/local/hadoop/conf")

## Loading the RHIPE library
library(Rhipe) 

## initializing the RHIPE subsystem, which mostly used for debugging the RHIPE installation
rhinit()

## Defining the Map phase 
Map(function(k,v){

## for generating the random deviates
  X ? runif(v)

## for emitting the key-value pairs with key – k and 
## value – min and max of generated random deviates.
  rhcollect(k, c(Min=min(x),Max=max(x))
}
## Create and running a MapReduce job by follwoingobject
 job = rhwatch(map=map,input=10,reduce=0, 
output='/app/Hadoop/RHIPE/test',jobname='test')

## Read the results of job from HDFS
result <- rhread(job)

## Displaying the result 
outputdata  <- do.call('rbind', lapply(result, "[[", 2))