#!/bin/bash

# Define variables
VM_2=$1
PORT=$2
DURATION=$3
INTERVAL=$4
ID1=$5
ID2=$6

# Pull the Docker image on VM_2
ssh $VM_2 "docker pull HaimFC/Docker-Kubernetes-Lab"

# Run the Docker container on VM_2
ssh $VM_2 "docker run --name ${ID1}_${ID2} -d -p ${PORT}:5201 HaimFC/Docker-Kubernetes-Lab"

# Run iperf client on VM_1
iperf3 -c $VM_2 -p $PORT -t $DURATION -i $INTERVAL

# Stop the Docker container on VM_2
ssh $VM_2 "docker stop ${ID1}_${ID2} && docker rm ${ID1}_${ID2}"

