#! /bin/bash

#read -p "Enter name of the cloudformation stack : " stackname

#This will fetch the details of the cluster name from the cloudformation output
aws --region us-east-1 cloudformation describe-stacks --stack-name eks --query "Stacks[0].Outputs[7].OutputValue" | sed 's/"//g' > eksname.txt

#This will update the cluster name with kubeconfig file 
aws eks --region us-east-1 update-kubeconfig --name $(cat eksname.txt)


if [ ! -f aws-auth-cm.yaml ]
then
    touch aws-auth-cm.yaml
fi
>aws-auth-cm.yaml

#getting the nodes role arn
aws --region us-east-1 cloudformation describe-stacks --stack-name eks --query "Stacks[0].Outputs[4].OutputValue" | sed 's/"//g' > noderole.txt

echo "apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: $(cat noderole.txt)
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes" > aws-auth-cm.yaml


kubectl apply -f aws-auth-cm.yaml

rm eksname.txt
rm noderole.txt
