FROM amazonlinux:2023

RUN yum update && yum install openssh-server openssh-clients vim wget net-tools gzip ca-certificates tar python python-pip python-setuptools -y

WORKDIR /app

COPY jre-8u381-linux-x64.tar.gz .

RUN tar -xvzf jre-8u381-linux-x64.tar.gz -C /usr/local/bin \
&& rm jre-8u381-linux-x64.tar.gz

ENV PATH=${PATH}:/usr/local/bin/jre1.8.0_381/bin \
JAVA_HOME=/usr/local/bin/jre1.8.0_381 \
SPARK_VERSION=3.0.2 \
HADOOP_VERSION=3.2 \
SPARK_HOME=/opt/spark \
PYTHONHASHSEED=1

RUN wget --no-verbose -O apache-spark.tgz "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" \
&& mkdir -p /opt/spark \
&& tar -xf apache-spark.tgz -C /opt/spark --strip-components=1 \
&& rm apache-spark.tgz

COPY requirements.txt .

RUN pip install -r requirements.txt 

COPY start-cluster.sh .

EXPOSE 8080 7077 6066

ENTRYPOINT [ "bash", "start-cluster.sh" ]

CMD [ "bash" ]
#CMD [ "/opt/spark/bin/spark-submit", "demo_pyspark.py" ]