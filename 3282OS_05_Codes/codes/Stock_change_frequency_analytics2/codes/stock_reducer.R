================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 4 Using Hadoop Streaming with R 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

#! /usr/bin/env Rscript
stock.key <- NA
stock.val <- 0.0

# Open connection to standard input stream
conn <- file("stdin", open="r")
while (length(next.line <- readLines(conn, n=1)) > 0) {
  split.line <- strsplit(next.line, "\t")
  key <- split.line[[1]][1]
  val <- as.numeric(split.line[[1]][2])
  if (is.na(current.key)) {
    current.key <- key
    current.val <- val
  }
  else {
    if (current.key == key) {
      current.val <- current.val + val
    }
    else {
	  # Emitting key and values
      write(paste(current.key, current.val, sep="\t"), stdout())
      current.key <- key
      current.val<- val
    }
  }
}

# Emitting key and values
write(paste(current.key, current.val, sep="\t"), stdout())
close(conn)
