# ami
Use Packer -> AMI -> EC2 Instance

# Instructions for setting up your instance using CloudFormation and AMI:
1. AWS Configure Quick Configuration:
    ```bash
    aws configure --profile produser
    ```

2. Creat Networking Resources:

    Default properties:
    ```bash
    aws cloudformation create-stack --stack-name vpc-2 --template-body file://csye6225-infra.json
    ```

    Custom properties:
    ```bash
    aws cloudformation create-stack --stack-name vpc-2 --template-body file://csye6225-infra.json --parameters ParameterKey=AMINAME,ParameterValue="ami-0b417b29c9b10fdf6" ParameterKey=VPCNAME,ParameterValue="myVPC-2" ParameterKey=VPCCIDR,ParameterValue="10.0.0.0/16" ParameterKey=IGWNAME,ParameterValue="myIGW-2" ParameterKey=PUBLICROUTETABLENAME,ParameterValue="myPRT-2" ParameterKey=subnetNAME01,ParameterValue="subnet1-2" ParameterKey=SubnetCIDR1,ParameterValue="10.0.1.0/24" ParameterKey=subnetNAME02,ParameterValue="subnet2-2" ParameterKey=SubnetCIDR2,ParameterValue="10.0.2.0/24" ParameterKey=subnetNAME03,ParameterValue="subnet3-2" ParameterKey=SubnetCIDR3,ParameterValue="10.0.3.0/24"
    ```

3. Cleanup Networking Resources:
    ```bash
    aws cloudformation delete-stack --stack-name my-stack
    ```

# Instructions for setting up your AMI using Packer:

1. Default method:

    When we merge the PR, workflow will help us deploy AMI automatically 

2. Create AMI by packer localy:

    ```bash
    packer build -var-file vars.json ami.json
    ```

