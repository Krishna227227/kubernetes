#!/bin/bash
a=$(microk8s kubectl get pods -n react-nginx |grep react |awk {'print $1'})
microk8s kubectl delete pod $a -n react-nginx 
