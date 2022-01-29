# WordCount uses MapReduce in Hadoop HDFS

## Overview

* This project uses:
    * Version 
    <table>
    <tr>
        <td>Hadoop</td>
        <td>2.10.1</td>
    </tr>
    <tr>
        <td>Javac</td>
        <td>1.8.0_312</td>
    </tr>
   </table>
   
   * Classes 
    <table>
    <tr>
        <td>Class</td>
        <td>Extends</td>
        <td>Implements</td>
    </tr>
    <tr>
        <td>Map</td>
        <td>MapReduceBase</td>
        <td>Mapper</td>
    </tr>
   <tr>
        <td>Combiner</td>
        <td>MapReduceBase</td>
        <td>Reducer</td>
    </tr>
    <tr>
        <td>Reduce</td>
        <td>MapReduceBase</td>
        <td>Reducer</td>
    </tr>
    <tr>
        <td>Main</td>
        <td>None</td>
        <td>None</td>
    </tr>
   </table>
   
   * 4300.txt is a input data file. The input is a long description of website project. We make use of this input for demonstrating MapReduce in Hadoop.
   
## Build project

* Step 1: Export Hadoop classpath
  * *export HADOOP_CLASSPATH=$(hadoop classpath)*
  * *echo $HADOOP_CLASSPATH*
* Step 2: Create compiled directory
  * *mkdir container*
* Step 3: Compile project with Hadoop JARs
  * *javac -cp ${HADOOP_CLASSPATH}:container/:. -d container/ Map.java*
  * *javac -cp ${HADOOP_CLASSPATH}:container/:. -d container/ Combiner.java*
  * *javac -cp ${HADOOP_CLASSPATH}:container/:. -d container/ Reducer.java*
  * *javac -cp ${HADOOP_CLASSPATH}:container/:. -d container/ Main.java*
* Step 4: Create project JAR file
  * *jar -cvf wc.jar -C container/ .*
  
## Step & Run project

* Step 1: Create Hadoop input directory for storing our data
  * *hadoop fs -mkdir inputdir*
* Step 2: Copy our local data to Hadoop HDFS directory
  * *hadoop fs -put inputdir/\* inputdir*
* Step 3: Run MapReduce job in Hadoop
  * *hadoop jar wc.jar WordCountPackage.Main inputdir outputdir*
* Step 4: View MapReduce result
  * *hadoop fs -cat outputdir/part-00000*
