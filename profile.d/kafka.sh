#!/bin/bash

alias kcat="kafkacat -b $KAFKA_BROKER_LIST"
alias kcon="kafka-console-consumer.sh --zookeeper $ZOOKEEPER_URI --topic $@"
alias kprod="kafka-console-producer.sh --broker-list $KAFKA_BROKER_LIST --topic $@"
alias ktopic="kafka-topics.sh --zookeeper $ZOOKEEPER_URI $@"
