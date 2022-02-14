FROM ubuntu
RUN apt update && apt install -y openssh-server openssh-client vim openjdk-8-jdk


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

ADD configurations/start-dfs.sh $HADOOP_HOME/sbin
ADD configurations/stop-dfs.sh $HADOOP_HOME/sbin
ADD configurations/start-yarn.sh $HADOOP_HOME/sbin
ADD configurations/stop-yarn.sh $HADOOP_HOME/sbin
ADD configurations/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
ADD configurations/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
ADD configurations/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD configurations/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
ADD configurations/slaves $HADOOP_HOME/etc/hadoop/slaves

ENV PATH $HADOOP_HOME/bin:$PATH


# SPARK
RUN wget https://archive.apache.org/dist/spark/spark-3.0.0/spark-3.0.0-bin-hadoop2.7.tgz
RUN tar xvf spark-3.0.0-bin-hadoop2.7.tgz
RUN mv spark-3.0.0-bin-hadoop2.7 /usr/local/spark
ENV SPARK_HOME /usr/local/spark
ENV PATH $SPARK_HOME/sbin:$PATH
ENV PATH $SPARK_HOME/bin:$PATH

ADD configurations/slaves $SPARK_HOME/conf/slaves


# FORMAT NAMENODE
ARG FORMAT_NAMENODE_COMMAND
RUN $FORMAT_NAMENODE_COMMAND
EXPOSE 22