FROM ubuntu
RUN apt update && apt install -y openssh-server openssh-client vim openjdk-8-jdk
RUN apt update && apt install -y python3-pip && pip3 install mrjob

# SSH
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys


# CONFIG JAVA ENVINROMENT VARIBLES
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64


# HADOOP
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-2.10.1/hadoop-2.10.1.tar.gz
RUN tar -xzf hadoop-2.10.1.tar.gz
RUN mv hadoop-2.10.1 usr/local/hadoop
ENV HADOOP_HOME /usr/local/hadoop
ENV CONF_DIR $HADOOP_HOME/etc/hadoop
ENV PATH $HADOOP_HOME/sbin:$PATH


# HADOOP - CREATE DIRECTORY FOR STORING DOCUMENTS
RUN mkdir /home/hadoop /home/hadoop/hdfs
RUN mkdir /home/hadoop/tmp /home/hadoop/hdfs/namenode /home/hadoop/hdfs/datanode
RUN chmod 777 /home/hadoop/hdfs/namenode
RUN chmod 777 /home/hadoop/tmp
RUN chmod 777 /home/hadoop/hdfs/datanode

ADD hadoop/v2.10.1-hadoop2/configurations/configurations/start-dfs.sh $HADOOP_HOME/sbin
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/stop-dfs.sh $HADOOP_HOME/sbin
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/start-yarn.sh $HADOOP_HOME/sbin
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/stop-yarn.sh $HADOOP_HOME/sbin
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
ADD hadoop/v2.10.1-hadoop2/configurations/configurations/slaves $HADOOP_HOME/etc/hadoop/slaves

ENV PATH $HADOOP_HOME/bin:$PATH


# # SPARK
# RUN wget https://archive.apache.org/dist/spark/spark-3.0.0/spark-3.0.0-bin-hadoop2.7.tgz
# RUN tar xvf spark-3.0.0-bin-hadoop2.7.tgz
# RUN mv spark-3.0.0-bin-hadoop2.7 /usr/local/spark
# ENV SPARK_HOME /usr/local/spark
# ENV PATH $SPARK_HOME/sbin:$PATH
# ENV PATH $SPARK_HOME/bin:$PATH

# ADD configurations/slaves $SPARK_HOME/conf/slaves


# HBASE
RUN wget https://downloads.apache.org/hbase/2.4.11/hbase-2.4.11-bin.tar.gz
RUN tar xvf hbase-2.4.11-bin.tar.gz
RUN mv hbase-2.4.11 /usr/local/hbase
RUN mkdir /usr/local/zookeeper
RUN chmod 777 /usr/local/zookeeper
ENV HBASE_HOME /usr/local/hbase
ENV PATH $HBASE_HOME/bin:$PATH

ADD hadoop/v2.10.1-hadoop2/configurations/configurations/hbase-site.xml $HADOOP_HOME/conf/hbase-site.xml


# FORMAT NAMENODE
ARG FORMAT_NAMENODE_COMMAND
RUN $FORMAT_NAMENODE_COMMAND
EXPOSE 22