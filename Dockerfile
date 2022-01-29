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


# CREATE DIRECTORY FOR STORING DOCUMENTS
RUN mkdir /home/hadoop /home/hadoop/hdfs
RUN mkdir /home/hadoop/tmp /home/hadoop/hdfs/namenode /home/hadoop/hdfs/datanode

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