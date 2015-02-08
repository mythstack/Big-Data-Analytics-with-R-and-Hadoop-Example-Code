================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 4 Using Hadoop Streaming with R 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================
# To identify the type of the script, here it is RScript
#! /usr/bin/env Rscript

# Defining the variables with their initial values
city.key <- NA
page.value <- 0.0

# To initiating the connection to standard input
input <- file("stdin", open="r")

# Running while loop until all the lines are read
while (length(currentLine <- readLines(input, n=1)) > 0) {

# Splitting the line into vectors by tab(“\t”) separator
  fields <- strsplit(currentLine, "\t")

# Capturing key and value form the fields
  key <- fields[[1]][1]
  value <- as.character(fields[[1]][2])
  
  # Setting up key and values
  if (is.na(city.key)) {
    city.key <- key
    page.value <- value
  }
  else {
    if (city.key == key) {
      page.value <- c(page.value, value)

    } else {

  page.value <- unique(page.value)
  
  #Printing key and value to standard output 
  print(list(city.key, page.value),stdout())
      city.key <- key
      page.value <- value
    }
  }
}

print(list(city.key, page.value), stdout())

# Closing the connection
close(input)