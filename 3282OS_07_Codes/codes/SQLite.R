================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 mporting and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

################################################################################
# SQLite
## install sqllite by firing the following commands
#   sudo apt-get purge sqlite3 sqlite3-doc libsqlite3-0
#   sudo apt-get autoremove
#   sudo apt-get install sqlite3 sqlite3-doc
################################################################################

# installaing RSQLite library from CRAN in R
Install.packages("RSQLite")

# loading the installed package
library("RSQLite")

# connect to db
con <- dbConnect(SQLite(), dbname="data/first.db")

# list all tables
tables <- dbListTables(con)

# exclude sqlite_sequence (contains table information)
tables <- tables[tables != "sqlite_sequence"]
lDataFrames <- vector("list", length=length(tables))

# create a data.frame for each table
for (i in seq(along=tables)) {
  lDataFrames[[i]] <- dbGetQuery(conn=con, statement=paste("SELECT * FROM '", tables[[i]], "'", sep=""))
}


# For firing Delete query in SQLite db
dbBeginTransaction(con)
rs <- dbSendQuery(con, "DELETE from candidates WHERE age > 50")

# For writing tavle from R dataframe
data(USArrests)
dbWriteTable(con, "USArrests", USArrests)

