// Defining package of the class
package com.PACKT.chapter1;

// Importing java libraries
import java.io.*;
import java.util.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
 
// Defining the Reduce class
public class Reduce extends MapReduceBase implements Reducer<Text, IntWritable, Text, IntWritable>{

// Defining the reduce method for aggregating the generated output of Map phase 
    public void reduce(Text key, Iterator<IntWritable> values, OutputCollector<Text,IntWritable> output, Reporter reporter) throws IOException {
        int count = 0;
        while(values.hasNext()) {
            count += values.next().get();
        }
        output.collect(key, new IntWritable(count));
    }
}
