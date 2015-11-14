#!/bin/bash

alias ip_pub="facter -p ec2_public_ipv4"
alias ip_priv="facter -p ipaddress"
#export instance_id=$(aws ec2 run-instances --region us-east-1 --key $USER --instance-type t1.micro --image-id ami-d9a98cb0 --output text --query 'Instances[*].InstanceId' 2>>/dev/null)
#export ip_address=$(aws ec2 describe-instances --instance-ids $instance_id --output text --query 'Reservations[*].Instances[*].PublicIpAddress' 2>>/dev/null)
alias aws_list_all_private="aws ec2 describe-instances --query 'Reservations[].Instances[].[PrivateIpAddress,Tags[?Key==\`Name\`].Value[]]' --filters 'Name=tag:Name,Values=*' --output text | sed '$!N;s/\n/ /'|grep -v None"
alias aws_list_all_public="aws ec2 describe-instances --query 'Reservations[].Instances[].[PublicIpAddress,Tags[?Key==\`Name\`].Value[]]' --filters 'Name=tag:Name,Values=*' --output text | sed '$!N;s/\n/\t/'|grep -v None"
alias aws_show_ip_for="aws ec2 describe-instances --query 'Reservations[].Instances[].[PublicIpAddress,Tags[?Key==\`Name\`].Value[]]' --filters 'Name=tag:Name,Values="$@"' --output text | sed '$!N;s/\n/ /'|grep -v None"


