#!/bin/bash
this_dir=$( dirname -- "${BASH_SOURCE[0]}" )
work_dir=$this_dir/work
rm -rf $work_dir
mkdir $work_dir
cd $work_dir

curl -OLfs https://dlcdn.apache.org/flink/flink-1.16.1/flink-1.16.1-bin-scala_2.12.tgz
tar -xvzf flink-1.16.1-bin-scala_2.12.tgz
cd flink-1.16.1
wget https://github.com/streamnative/flink/releases/download/v1.16.0.0/flink-sql-connector-pulsar-1.16.0.0.jar -P lib





