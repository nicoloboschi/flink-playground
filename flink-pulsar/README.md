# Run Pulsar use cases

## Requirements
- Java 11 (JAVA 17 doesn't work)
- Docker
- Pulsar shell

## Common setup

1. Download flink and the pulsar connector
```
./flink-pulsar/download-flink.sh
```
2. Run flink and pulsar. Then open the Flink sql client.
```
./flink-pulsar/main.sh
```

## Use cases
The use cases file are composed by a Pulsar command that needs to be copied and executed in another terminal AND by a flink sql statements to demonstrate the behaviour.

