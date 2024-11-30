#!/bin/bash

echo "-= Starting =-"
echo "-= Creating resources =-"
kubectl apply -f hw2_resources_ver1.yaml --record=true

IP=$(kubectl get svc | grep sectionbv1 | awk '{print $3}')
echo "-= The IP address of my service is: $IP =-"

END=$((SECONDS+240))
while [ ${SECONDS} -lt ${END} ]; do wget $IP:80 -q -O- ; done

echo "-= Updating application =-"
kubectl apply -f hw2_resources_ver2.yaml --record=true
kubectl rollout status deployment sectionbv1
sleep 1
wget $IP:80 -q -O-

echo "-= Rolling back =-"
kubectl rollout undo deployment sectionbv1
kubectl rollout status deployment sectionbv1
sleep 1
wget $IP:80 -q -O-

echo "-= Cleaning up =-"
kubectl delete svc sectionbv1 && kubectl delete deployment sectionbv1 && kubectl delete hpa sectionbv1
echo "-= Great Success! =-"
