================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 4 Using Hadoop Streaming with R 
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

# Loading the RGoogleAnalytics library
require("RGoogleAnalyics")

# Step 1. Authorize your account and paste the accesstoken 
query <- QueryBuilder()
access_token <- query$authorize()

# Step 2.  Create a new Google Analytics API object
ga <- RGoogleAnalytics()

# To retrieve profiles from Google Analytics 
ga.profiles <- ga$GetProfileData(access_token)

# List the GA profiles 
ga.profiles

# Step 3. Setting up the input parameters
profile <- ga.profiles$id[3] 
startdate <- "2010-01-08"
enddate <- "2013-08-23"
dimension <- "ga:date,ga:source,ga:pageTitle,ga:pagePath"
metric <- "ga:visits"
#filter <- 
#segment <- 
sort <- "ga:visits"
maxresults <- 100099

# Step 4.   Build the query string, use the profile by setting its index value 
query$Init(start.date = startdate,
           end.date = enddate,
           dimensions = dimension,
           metrics = metric,
           #sort = sort,
           #filters="",
           #segment="",
           max.results = maxresults,
           table.id = paste("ga:",profile,sep="",collapse=","),
           access_token=access_token)

# Step 5. Make a request to get the data from the API
ga.data <- ga$GetReportData(query)

# Look at the returned data
head(ga.data)

# Writing extracted Google Analytics data to csv file
write.csv(ga.data,"webpages.csv", row.names=FALSE)                                                
