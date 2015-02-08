================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 mporting and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================
# For Excel

# For reading the Excel file from R
es <- read.xlsx("D:/ga.xlsx",1) 

# Defining r object to be written to Excel file
r <- res[1:5,]

# For writing R objects to Excel file
ress <- write.xlsx(r, "D:/ga1.xls")  

