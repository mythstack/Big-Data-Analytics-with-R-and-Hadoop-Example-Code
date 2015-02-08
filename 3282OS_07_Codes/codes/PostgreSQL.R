================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 mporting and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

################################################################################
# PostgreSQL
# updating the packages list
#   apt-get update
# installing postgresql 
#   sudo apt-get install postgresql postgresql-contrib
# creating postgresql user
#   su – postgres createuser
################################################################################

# installing package from CRAN
install.packages(RPostgreSQL)

# loading the installed package
library(RPostgreSQL)
## load the PostgreSQL driver
drv <- dbDriver("PostgreSQL")

## Open a connection
con <- dbConnect(drv, dbname="oxford")

## Submits a statement
rs <- dbSendQuery(con, "select * from student")

## fetch all elements from the result set
fetch(rs,n=-1)

## Closes the connection
dbDisconnect(con)

## Frees all the resources on the driver
dbUnloadDriver(drv)

# Firing Delete query on DB
dbGetQuery(con, "BEGIN TRANSACTION")
rs <- dbSendQuery(con,
"Delete * from sales as p where p.cost>10")
if(dbGetInfo(rs, what = "rowsAffected") > 250){
warning("Rolling back transaction")
dbRollback(con)
}else{
dbCommit(con)
}

# Writing a PostgreSQL table from R Dataframe object, 
conn <- dbConnect("PostgreSQL", dbname = "wireless")
if(dbExistsTable(con, "frame_fuel")){
dbRemoveTable(conn, "frame_fuel")
dbWriteTable(conn, "frame_fuel", fuel.frame)
}
if(dbExistsTable(conn, "RESULTS")){
dbWriteTable(conn, "RESULTS", results2000, append = T)
else
dbWriteTable(conn, "RESULTS", results2000)
}