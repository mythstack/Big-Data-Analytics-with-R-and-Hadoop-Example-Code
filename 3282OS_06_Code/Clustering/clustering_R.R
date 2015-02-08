================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 6 Understanding Big Data Analysis with Machine Learning  
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

# Loading iris flower dataset 
data("iris")

# Generating clusters for iris dataset
kmeans <- kmeans(iris[, -5], 3, iter.max = 1000)

# Comparing iris Species with generated cluster points
Comp <- table(iris[, 5], kmeans$cluster)
