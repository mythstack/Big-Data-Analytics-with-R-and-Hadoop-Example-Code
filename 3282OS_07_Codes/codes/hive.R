
================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 Importing and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

################################################################################
# HIVE
#
#
# Downloading the hive source from apache mirror
#   wget http://www.motorlogy.com/apache/hive/hive-0.11.0/hive-0.11.0.tar.gz
#
# For extracting the hive source
#   tar xzvf  hive-0.11.0.tar.gz
# 
# Update hive-site.xml
#
# <description> JDBC connect string for a JDBC metastore </ description>
# </Property>
# 
# <property>
# <name> javax.jdo.option.ConnectionDriverName </ name>
# <value> com.mysql.jdbc.Driver </ value>
# <description> Driver class name for a JDBC metastore </ description>
# </Property>
# 
#<property>
#<name> javax.jdo.option.ConnectionUserName </ name>
#<value> hive </value>
#<description> username to use against metastore database </ description>
#</ Property>
#
#<property>
#<name> javax.jdo.option.ConnectionPassword </name>
#<value> hive</value>
#<description> password to use against metastore database </ description>
#</Property>
#
#<property>
#<name> hive.metastore.warehouse.dir </ name>
#<value> /user/hive/warehouse </value>
#<description> location of default database for the warehouse </ description>
#</Property>
###
#
# setting up hive-log4j.properties
#log4j.appender.EventCounter = org.apache.hadoop.log.metrics.EventCounter
#
#export $HIVE_HOME=/usr/local/ hive-0.11.0
# $HADOOP_HOME/bin/ hadoop fs-mkidr /tmp
# $HADOOP_HOME/bin/ hadoop fs-mkidr /user/hive/warehouse
# $HADOOP_HOME/bin/ hadoop fs-chmod g+w / tmp
# $HADOOP_HOME/bin/ hadoop fs-chmod g+w /user/hive/warehouse
#
#
# for setting up java configuration variables
#   sudo R CMD javareconf
#
################################################################################
# Installing rJava package
install.packages ("rJava")

# Installing RHive package from CRAN
install.packages(“RHive”)

# Loading RHive library
library(“RHive”)

# initialize Rhive resources
rhive.init ()

# connecting R and Hive by Hive server
rhive.connect ("192.168.1.210")

# Listing avilable tables from Hive in R
rhive.list.tables ()
             tab_name
1 hive_algo_t_account
2 o_account
3 r_t_account

# Firing Select query from R to retrive data as per condition
rhive.query ("select * from o_account");