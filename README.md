**NodeJS and MongoDB App**
1. docker-compose file with docker file created in repo root directory, the docker-compose bootstrapping two containers the first on the nodejs application by building Dockerfile and the second the mongodb container, this docker-compose file should used for development only.
2. created Jenkins Pipeline as requested with Jenkinsfile name in the repo. 
3. the jenkinsfile bootstrap mongodb container and building the nodejs application and setup the connection between both containers to run the tests you can find it in repo root.
4. created kubernetes deployment, service, ingress for the nodejs application, and deployment, service for mongodb container. and the i used secrets for mongodb and nodejs application to connect the nodejs app to mongodb.
5. created helm chart with mongodb dependency and nodejs application with ingress. you can for sure enable and disable the mongodb chart dependency. 
6. i added some changes to nodejs application to allow using separated values for MongoDB host, user, password, db, port to be more secure to use secrets in kubernetes you can review it by checking this commit https://github.com/tarekesmail/node-express-realworld-example-app/commit/42a2a77555e91d7dd28464f5122f4e2ebc9dd6e9

The docker-compose can be run with the following command after cloning the repo

    cd .docker/ && docker-compose run -d --build

The Yamls for k8s can be installed by kubectl

    kubectl create -f yamls/ 
The helm chart can be installed by 

    helm install app ./helm

**Terraform EC2** 
As requested i created ec2 machine with 20G root volume and 100G external ebs volume, i selected the machine type c6g because in case of we will perform some complex equations we will need CPU optimized machines, and i selected it Graviton because this is new ec2 generation with optimized performance and cost. this benchmark results talking more about the difference https://www.percona.com/blog/comparing-graviton-performance-to-arm-and-intel-for-mysql/

to use this terraform files you have to specify the vpc and subnet which you will use it to create this ec2

**Enhancements** 
Definitely we have lot of enhancements on the provided work can performed like 
1. Create Moduls for EC2 machine, and volumes to dynamically add volumes depending on variables for counting
2. I added the s3 bucket as backend and DynamoDB LockID table to prevent terraform state file drifting but i commented it in providers.tf file *the terraform statefile should be in safe place like s3
3. Implementing CICD for our application deployment using kubernetes 
4. Adding some security policy for this deployment like run as non root user, and some security context
5. Applying some docker image best practices to use alpine image to size down the image, and add some security practices as well in dockerfile

The point maybe here why i didn't applied the above enhancements, actually i know very well the purpose of this task to present the skills not for production grade solutions :) so if it will for production another work quality and measures will be applied :)

Finally Thanks for this task, the actual work hours for this task is 4 hours 


