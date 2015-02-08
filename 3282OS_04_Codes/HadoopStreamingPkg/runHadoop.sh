#! /usr/bin/env bash
HADOOP="$HADOOP_HOME/bin/hadoop"   # Hadoop command

HADOOPSTREAMING="$HADOOP jar
$HADOOP_HOME/contrib/streaming/hadoop-streaming-1.0.3.jar" # change version number as appropriate

RLIBPATH=/usr/local/lib/R/site-library  # can specify additional R Library paths here


INPUTFILE="anna.txt"
HFSINPUTDIR="/HadoopStreaming"
OUTDIR="/HadoopStreamingRpkg_output"

RFILE=" home/hduser/Desktop/HadoopStreaming/inst/wordCntDemo/ hsWordCnt.R"
#LOCALOUT="/home/hduser/Desktop/HadoopStreaming/inst/wordCntDemo/annaWordCnts.out"
# Put the file into the Hadoop file system
#$HADOOP fs -put $INPUTFILE $HFSINPUTDIR



# Remove the directory if already exists (otherwise, won't run)
#$HADOOP fs -rmr $OUTDIR


MAPARGS="--mapper"  
REDARGS="--reducer"
JOBARGS="-cmdenv R_LIBS=$RLIBPATH" # numReduceTasks 0

# echo $HADOOPSTREAMING -cmdenv R_LIBS=$RLIBPATH  -input $HFSINPUTDIR/$INPUTFILE -output $OUTDIR -mapper "$RFILE $MAPARGS" -reducer "$RFILE $REDARGS" -file $RFILE 

$HADOOPSTREAMING $JOBARGS   -input $HFSINPUTDIR/$INPUTFILE -output $OUTDIR -mapper "$RFILE $MAPARGS" -reducer "$RFILE $REDARGS" -file $RFILE 


# Extract output
./$RFILE --reducecols > $LOCALOUT
$HADOOP fs -cat $OUTDIR/part* >> $LOCALOUT


