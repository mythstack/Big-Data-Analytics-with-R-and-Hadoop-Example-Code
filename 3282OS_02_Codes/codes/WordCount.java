//================================================================================
//Book - Big Data Analytics with R and Hadoop
//Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
//Chapter - 2 Writing Hadoop MapReduce Programs
//Author - Vignesh Prajapati
//Contact - a. email -> vignesh2066@gmail.com
//          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
//================================================================================
// Defining package of the class
package com.PACKT.chapter1;

// Importing java libraries
import java.io.*;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
import org.apache.hadoop.util.*;
import org.apache.hadoop.conf.*;
 
 // Defining wordcount class for job configuration information
public class WordCount extends Configured implements Tool{
 
 // run() method for setting the job configurations
    public int run(String[] args) throws IOException{
        JobConf conf = new JobConf(WordCount.class);
        conf.setJobName("wordcount");
 
        conf.setOutputKeyClass(Text.class);
        conf.setOutputValueClass(IntWritable.class);
 
        conf.setMapperClass(Map.class);
        conf.setReducerClass(Reduce.class);
 
        conf.setInputFormat(TextInputFormat.class);
        conf.setOutputFormat(TextOutputFormat.class);
 
        FileInputFormat.setInputPaths(conf, new Path(args[0]));
        FileOutputFormat.setOutputPath(conf, new Path(args[1]));
 
        JobClient.runJob(conf);
 
        return 0;
    }
// Defining the main() method to start the execution of the MapReduce program 
    public static void main(String[] args) throws Exception {
        int exitCode = ToolRunner.run(new WordCount(), args);
        System.exit(exitCode);
    }
 
}
