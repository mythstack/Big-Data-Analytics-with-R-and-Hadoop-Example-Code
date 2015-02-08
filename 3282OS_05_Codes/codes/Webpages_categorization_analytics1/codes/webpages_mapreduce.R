================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 4 Using Hadoop Streaming with R 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

# setting up the Hadoop variables need by RHadoop
Sys.setenv(HADOOP_HOME="/usr/local/hadoop/")
Sys.setenv(HADOOP_CMD="/usr/local/hadoop/bin/hadoop")

# Loading the Rhadoop libraries rmr2 and rhdfs
library(rmr2)
library(rhdfs)

# To initializing hdfs
hdfs.init()

# First loading the data to R console,
webpages <- read.csv("webpages_mapreduce.csv")

# Saving R file object to HDFS,
webpages.values <- to.dfs(webpages) 

mapper1 <- function(k,v) {
 
 # To storing pagePath column data in to key object
 key <- v[2]
 
 # To store visits column data into val object
 Val <- v[3]

 # emitting key and value for each row
 keyval(key, val)
}

totalvisits <- sum(webpages$visits)
reducer1 <- function(k,v) {
  
  # Calculating percentage visits for the specific URL
  per <- (sum(v)/totalvisits)*100
  
  # Identify the category of URL
  if (per <33 )
  {
    val <- "low"
  }
  
  if (per >33 && per < 67)
  {
    val <- "medium"
  }
  
  if (per > 67)
  {
    val <- "high"
  }
  
 # emitting key and values
 keyval(k, val)
}


#Mapper:
mapper2 <- function(k, v) {

# Reversing key and values and emitting them 
  keyval(v,k)
}


key <- NA
val <- NULL

# Reducer:
reducer2  <-  function(k, v) {


# for checking whether key-values are already assigned or not. 
  if(is.na(key)) {
    key <- k
    val <- v
   } else {
      if(key==k) {
      val <- c(val,v)
     } else{
        key <- k
        val <- v
     }
  }
# emitting key and list of values 
 keyval(key,list(val))
}
# executing Hadoop MapReduce 
output <- mapreduce(input=mapreduce(input=webpages.values,
                           map = mapper1,
                           reduce = reducer1),
                           map =mapper2,
                           reduce =reducer2,
                           combine=TRUE)

# Reading output data from HDFS						   
from.dfs(output)
