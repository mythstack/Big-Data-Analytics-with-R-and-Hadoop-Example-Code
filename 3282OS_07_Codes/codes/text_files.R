
================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 mporting and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================
# for reading csv file
Dataframe <- read.csv(“data.csv”,sep=”,”)

# for reading txt file
Dataframe <- read.table(“data.txt”, sep=”\t”)

# for loading .RDATA image file 
load("history.RDATA")

# for loading .rda file 
load("data_variables_a_and_b.rda")

# for writing csv file
write.csv(mydata, "c:/mydata.csv", sep=",", row.names=FALSE)

# for writing txt file
write.table(mydata, "c:/mydata.txt", sep="\t")

# for saving .RData
save.image()

# column vector
a <- c(1,2,3)

# column vector
b <- c(2,4,6)

# saving it to R (.rda) data format
save(a, b, file=" data_variables_a_and_b.rda")