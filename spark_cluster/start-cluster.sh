#!/bin/bash
if [ "$SPARK_WORKLOAD" == "master" ];
then
    /opt/spark/bin/spark-class org.apache.spark.deploy.master.Master --host $SPARK_MASTER_HOST --port 7077 --webui-port 8080
elif [ "$SPARK_WORKLOAD" == "worker" ];
then
# When the spark work_load is worker run class org.apache.spark.deploy.master.Worker
    /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker $SPARK_MASTER -c 1 -m 1G
else
    echo "Undefined Workload Type $SPARK_WORKLOAD, must specify: master, worker, submit"
fi