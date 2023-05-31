#!/bin/bash 
this_dir=$( dirname -- "${BASH_SOURCE[0]}" )
work_dir=$this_dir/work


JAVA_VER=$(java -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*".*/\1\2/p;')
echo "Java version: $JAVA_VER"
if [[ "$JAVA_VER" != "11"* ]]; then
    echo "Java version must be 11"
    exit 1
fi

start_pulsar() {
    docker rm -f pulsar-flink || true
    docker run -d --name pulsar-flink --rm -p 2181:2181 -p 8090:8090 -p 6650:6650 -p 9092:9092 apachepulsar/pulsar:3.0.0 bash -c """echo 'Starting...' && 
    export PULSAR_PREFIX_webServicePort=8090 &&
    export PULSAR_PREFIX_brokerDeleteInactiveTopicsEnabled=false &&
    bin/apply-config-from-env.py /pulsar/conf/standalone.conf &&
    ./bin/pulsar standalone --wipe-data -nss -nfw"""
    sleep 5
    echo "config use default
    admin --admin-url http://localhost:8090 namespaces create public/flink
    " | pulsar-shell - 
}
start_flink() {
    cd $work_dir
    cd flink-1.16.2
    ./bin/start-cluster.sh
    ./bin/sql-client.sh
}
start_pulsar
start_flink