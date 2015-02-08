================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 4 Using Hadoop Streaming with R 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

# Loading ggplot2 libray
library(ggplot2);

# we have stored above terminal output to stock_output.txt file

#loading it to R workspace
myStockData <- read.delim("stock_output.txt", header=F, sep="", dec=".");

# ploting the data with ggplot2 geom_smooth function
ggplot(myStockData, aes(x=V1, y=V2)) + geom_smooth() + geom_point();
