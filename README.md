# cloudformation-vpc-eks-nodes


This will create
- One VPC
- Two Public Subnet 
- Two Private Subnet with NAT Gateway
- A security Group for EKS cluster (with required ports) and Security group for EKS nodes with source access of EKS Cluster security group
- EKS Cluster
- EKS Nodes


EKS Creation via CLI using Cloudformation & parameter file

# Prerequsties

- kubectl should be installed on the machine from where you going to manage the cluster (Either in local or in Cloud) https://kubernetes.io/docs/tasks/tools/install-kubectl/  or " snap install kubectl --classic"

- Machine should be configured with AWS IAM user with relevant permissions attached to the user policy

- IAM authenticator should be instlled configured from (https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
or You can use the shell script to congiure this
	- linux (wget )
	- mac ( wget )

- AWS EC2 KeyPair ( which is used for ssh into nodes when required)

# EKS creation

- Template link https://github.com/AnandBaby/cloudformation-vpc-eks-nodes/blob/master/eks.json

- Parameter link https://github.com/AnandBaby/cloudformation-vpc-eks-nodes/blob/master/parameter.json

- Clone the git repo " https://github.com/AnandBaby/cloudformation-vpc-eks-nodes "

- Edit the parameter values in 'eks' folder accordingly

# cloudformation stack creation

- Execute the command " aws cloudformation create-stack  --stack-name eks --template-body file://eks.json --parameters  file://parameter.json --capabilities CAPABILITY_NAMED_IAM "

# Executing the values directly

- " aws cloudformation create-stack  --stack-name eks --template-body https://raw.githubusercontent.com/AnandBaby/cloudformation-vpc-eks-nodes/master/eks.json --parameters  https://raw.githubusercontent.com/AnandBaby/cloudformation-vpc-eks-nodes/master/parameter.json --capabilities CAPABILITY_NAMED_IAM "

# Connecting nodes with eks cluster

- use this shell script and run it locally (wget )


- Now ececute "kubect get nodes" you can see the nodes

