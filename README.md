# cloudformation-vpc-eks-nodes


This will create
- One VPC
- Two Public Subnet 
- Two Private Subnet with NAT Gateway
- A security Group for EKS cluster (with required ports) and Security group for EKS nodes with source access of EKS Cluster security group
- EKS Cluster
- EKS Nodes

