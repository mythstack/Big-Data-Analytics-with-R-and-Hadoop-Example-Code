================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 4 Using Hadoop Streaming with R 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

#! /usr/bin/env Rscript                                                 
# To disable the warnings
options(warn=-1)                                                       

# To take input the data from streaming
input <- file("stdin", "r")                                             

# To reading the each lines of documents till the end
while(length(currentLine <-readLines(input, n=1, warn=FALSE)) > 0) {

# To split the line by “,” seperator
   fields <- unlist(strsplit(currentLine, ","))                         

# Capturing open column value
   open <- as.double(fields[2])             

# Capturing close columns value
   close <- as.double(fields[5]) 

# Calculating the difference of close and open attribute 
  change <- (close-open)
                                              
# Emitting change as key and value as 1
write(paste(change, 1, sep="\t"), stdout())
}

# To close stream connection
close(input)
