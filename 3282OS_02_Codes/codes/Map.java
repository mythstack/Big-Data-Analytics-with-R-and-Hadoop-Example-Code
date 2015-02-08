package com.PACKT.chapter1;

import java.io.*;
import java.util.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
 
public class Map extends MapReduceBase implements Mapper<LongWritable, Text, Text, IntWritable>{
    public void map(LongWritable key, Text value, OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {
        StringTokenizer st = new StringTokenizer(value.toString().toLowerCase());
        while(st.hasMoreTokens()) {
            output.collect(new Text(st.nextToken()), new IntWritable(1));
        }
    }
}
