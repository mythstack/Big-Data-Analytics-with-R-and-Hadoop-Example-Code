================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 mporting and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================
################################################################################
# HBAse 
# 
# wget http://apache.cs.utah.edu/hbase/stable/hbase-0.94.11.tar.gz
#
#tar -xzf hbase-0.94.11.tar.gz
# 
# 
# vi conf/hbase-site.xml
#
# ~ vi conf / hbase-env.sh
#    export JAVA_HOME = /usr/lib/jvm/java-6-sun
#    export HBASE_HOME = /usr/local/hbase-0.94.11
#    export HADOOP_INSTALL = /usr/local/hadoop
#    export HBASE_CLASSPATH = /usr/local/hadoop/conf
#    export HBASE_MANAGES_ZK = true

# Copy Hadoop environment configuration files and libraries	
#   vi conf / hbase-site.xml

# <configuration>
#      <property>
#        <name> hbase.rootdir </name>
#        <value> hdfs://master:9000/hbase </value>
#      </Property>
#
#      <property>
#        <name>hbase.cluster.distributed </name>
#        <value>true</value>
#      </Property>
#
#      <property>
#         <name>dfs.replication </name>
#         <value>1</value>
#      </Property>
#
#      <property>
#        <name>hbase.zookeeper.quorum </name>
#        <value>master</value>
#      </Property>
#
#      <property>
#          <name>hbase.zookeeper.property.clientPort </name>
#          <value>2181</value>
#      </Property>
#
#      <property>
#        <name>hbase.zookeeper.property.dataDir </name>
#        <value>/root/hadoop/hdata</value>
#      </Property>
#    </ Configuration>
#
#  Setting up the environment variables for HBase
#	   cp $HADOOP_HOME/conf/hdfs-site.xml $HBASE_HOME/conf
#      cp $HADOOP_HOME/hadoop-core-1.0.3.jar $HBASE_HOME/lib
#      Cp $HADOOP_HOME/lib/commons-configuration-1.6.jar $HBASE_HOME/lib
#      cp $HADOOP_HOME/lib/commons-collections-3.2.1.jar $HBASE_HOME/lib
#
# Installation of Thrift:  
#   wget http://archive.apache.org/dist/thrift/0.8.0/thrift-0.8.0.tar.gz
#   tar xzvf thrift-0.8.0.tar.gz
#   cd thrift-0.8.0/
#
# Installing HBase
#  ./Configure
#  Make
#  Make install
#
# Install rhbase:
#   wget https://github.com/RevolutionAnalytics/rhbase/blob/master/build/rhbase_1.2.0.tar.gz
# 
#
#   R CMD INSTALL rhbase_1.2.0.tar.gz

# List all tables:
hb.list.tables ()

# Display table structure:
hb.describe.table ("student_rhbase")

# Read data:
hb.get ('student_rhbase', 'mary')

# Create table:
hb.new.table ("student_rhbase", "info")

# Insert a data:
hb.insert ("student_rhbase", list (list ("mary", "info: age", "24")))

# Delete Sheet (HBASE need two commands, rhbase only one operation)
hb.delete.table ('student_rhbase')