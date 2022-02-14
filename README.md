# Services run on top Hadoop on Docker environment

## Overview

* This project uses:
    * Version 
    <table>
    <tr>
        <td>Hadoop</td>
        <td>2.10.1</td>
    </tr>
   <tr>
        <td>Spark</td>
        <td>3.0.0</td>
    </tr>
   <tr>
        <td>HBase</td>
        <td>2.3.7</td>
    </tr>
   <tr>
        <td>Docker</td>
        <td>20.10.12</td>
    </tr>
    <tr>
        <td>Java</td>
        <td>1.8</td>
    </tr>
   </table>
 
## Build & Run project
* Step 1: Create subnets and bridge for ***hadoop-network***
   * *docker network create --driver bridge hadoop-network --subnet=172.10.0.0/16*
* Step 2: Build image and run containers
   * *docker-compose up*
* Step 3: Check whether containers are running which are daemons of Hadoop cluster
   * *docker container ls*

***If want to end sessions, run***
   * *docker-compose down*
## Manipulate with daemons
* Attach node of HDFS cluster
   * *docker exec -it master/slave1/slave2/... /bin/bash*
* Check daemons UI
   * For Resource Manager (YARN): http://localhost:8080/
   * For Spark Job Management: http://localhost:4040/
   * For HBase Management: http://localhost:16010/
   * For Master Management (Namenode): http://localhost:50070/
