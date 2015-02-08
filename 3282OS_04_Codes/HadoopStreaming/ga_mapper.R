================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 4 Using Hadoop Streaming with R 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

#! /usr/bin/env Rscript                                                 
# To disable the warning massages to be printed
options(warn=-1)                                                        

# To initiating the connection to standard input 
input <- file("stdin", "r")                                             

# Running while loop until all the lines are read
while(length(currentLine <- readLines(input, n=1, warn=FALSE)) > 0) {

# Splitting the line into vectors by “,” separator 
   fields <- unlist(strsplit(currentLine, ","))                         

# Capturing the city and pagePath from fields 
   city <- as.character(fields[3])             
   pagepath <- as.character(fields[4]) 
 
# Printing bith to the standard output
 print(paste(city,pagepath,sep="\t"),stdout())

                                                                                                                                               
}

# Closing the connection to that input stream
close(input)
