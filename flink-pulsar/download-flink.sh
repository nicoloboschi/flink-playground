#!/bin/bash
set -e
FLINK_VERSION=${FLINK_VERSION:-1.16.2}
this_dir=$( dirname -- "${BASH_SOURCE[0]}" )
this_dir=$(realpath $this_dir)
work_dir=$this_dir/work
rm -rf $work_dir
mkdir $work_dir
cd $work_dir
echo "Downloading Flink $FLINK_VERSION"

curl -OLf https://dlcdn.apache.org/flink/flink-$FLINK_VERSION/flink-$FLINK_VERSION-bin-scala_2.12.tgz
tar -xvzf flink-$FLINK_VERSION-bin-scala_2.12.tgz
cd flink-$FLINK_VERSION
echo "Downloading Flink SQL connector for Pulsar"
wget https://github.com/streamnative/flink/releases/download/v1.16.0.0/flink-sql-connector-pulsar-1.16.0.0.jar -P lib
echo "Downloading Avro format support"
wget https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-avro/1.16.0/flink-sql-avro-1.16.0.jar -P lib





