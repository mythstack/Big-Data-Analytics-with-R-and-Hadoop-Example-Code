================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 mporting and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

###################################################################
#Installing MySQL
## Updating the linux package list
#     sudo apt-get update
## Upgrading the updated packages
#     sudo apt-get dist-upgrade
##
##First, install the MySQL server and client packages:
#     sudo apt-get install mysql-server mysql-client
####################################################################

# to install RMySQL library
install.packages("RMySQL")

#Loading RMySQL
library(RMySQL)

# To perform database connection in R with MySQL
mydb = dbConnect(MySQL(), user='root', password='', dbname='sample_table', host='localhost')

# To list MySQL tables
dbListTables(mydb)

# to list the fields of MySQL table
dbListFields(mydb, 'sample_table')

# For selecting the dataset from MySQL table
rs = dbSendQuery(mydb, "select * from sample_table")

# fetchint the data from MySQL which matched the above condition
dataset = fetch(rs, n=-1)

# for writing sql table from R dataframe
dbWriteTable(mydb, name='mysql_table_name', value=data.frame.name)

# defining data matrix
datamatrix <- matrix(1:4, 2, 2)

# defining query to insert the data
query <- paste("INSERT INTO names VALUES(",datamatrix [1,1], ",", datamatrix [1,2], ")")

# command for submitting the defined SQL query 
dbGetQuery(con, query)

# for firing sqk query for drop database
dbSendQuery(mydb, 'drop table if exists mysql_some_table’)