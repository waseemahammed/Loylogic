# Loylogic

CloudFormation templates are under : https://github.com/waseemahammed/Loylogic/tree/main/Cloudformation

CloudFormation teamplate for : 

- **VPC**
  - Creates VPC.
  - Creates IGW and Nat GW.
  - Routes tables for public and private routing.
  - Created Public and Private subnets with route tables attached.
 
**- Public server provisioning**  
  - Provisions EC2 in public subnet.
  - Installs chef and Jenkins.
  - Jenkins installation is made with this repo : 

**- Private server provisioning**  
  - Launches Ec2 in Private subnet.
  - Installation of chef in userdata and execution of chef-solo.
  - Chef installs docker and creates docker container with the artefacts created.


**Jenkins file** : https://github.com/waseemahammed/Loylogic/blob/main/Jenkinsfile
- Build code with maven.
- Builds image.
- Push image to docker hub.
- Deploy to Ec2 using CFN.

**Dockerfile** : https://github.com/waseemahammed/Loylogic/blob/main/Dockerfile

**Chef-repo** : https://github.com/waseemahammed/Loylogic/tree/main/chef-repo/loylogic-deployment

**Chef execution for docker container deployment : ** 
 - executes chef-solo (since no environment for chef-server setup).
 - Installs docker
 - Deploys docker container with docker hub image which is pushed after code build and docker build.
 - Deployment of docker container with custom tag support using environment and override attributes.


**Jenkins build : **
#1 : Jenkins
![image](https://user-images.githubusercontent.com/23531917/115952449-96e4e400-a503-11eb-80e9-d3b854cdc8e3.png)

#2 : All stages
![image](https://user-images.githubusercontent.com/23531917/115952464-b0862b80-a503-11eb-80b9-197e79ed4e53.png)

#3 : Maven build
![image](https://user-images.githubusercontent.com/23531917/115952474-c562bf00-a503-11eb-8c03-a6f40ed7b357.png)

#4: Docker build
![image](https://user-images.githubusercontent.com/23531917/115952485-d27fae00-a503-11eb-9eb7-e07b3061838d.png)

#5: docker tag and push
![image](https://user-images.githubusercontent.com/23531917/115952493-df9c9d00-a503-11eb-93bf-e23494550794.png)


**Chef deployment output : **
#1: docker container deployed
![image](https://user-images.githubusercontent.com/23531917/115952569-533eaa00-a504-11eb-970a-bbc281160451.png)

#2: docker container running
![image](https://user-images.githubusercontent.com/23531917/115952598-7a957700-a504-11eb-8fd9-4d1dc07b7999.png)


**Final output : **
![image](https://user-images.githubusercontent.com/23531917/115952542-1ecaee00-a504-11eb-9fb0-155c49df2168.png)
