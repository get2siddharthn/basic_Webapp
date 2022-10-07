# DEVOPS PROJECT: Jenkins, Ansbile, Docker, Flask
This is a demo project to containerize and  deploy a simple Flask application on Application server using Docker for containerizing and Ansible for its orchestration. Jenkins is used to create and maintain CI/CD pipeline for this project. 
The steps included in the process are:
1. SCM
2. Docker build
3. Docker push
4. Ansible deploy

The steps are illustrated in the diagram below. 
### Diagram
![architecture](devops_proj.png)
## Components
- SCM tool
- Jenkins server
- Application server
- Docker hub (or any other repository storage)
## SCM
For this project I have used Github is used for SCM. You can utilize any other SCM tool for this purpose, there is no restriction. Webhook is configured to trigger Jenkins pipeline in action. Jenkins will detect the changes in repository and clone the repository to the Jenkins server.
## Docker build
once the cloning is completed, Jenkins will make sure that the application is built into containers using docker. This will help in portability and requirement check for the application on every environment.
## Docker Push
After containerization and tagging Jenkins push docker image to Docker-hub for versioning and storage. This container can be pulled from Docker-hub for deployment in application server.
## Ansible deploy
Jenkins trigger Ansible present in the Jenkins server for orchestration of nodes (application nodes). The ansible playbook is run to install dependencies and pull docker images from Docker-hub and start the container. Ansible uses dev.inv for node identification, you can add any number of host.

## Constraints
- Usually it is advised to run Ansible and Jenkins on separate nodes, but for the simplicity of this project I have kept both on same node.
- Jenkins uses '*Jenkins*'used for its operation, hence you need to create Jenkins user in each Application server.
- Make sure that passwordless auth is done for the Jenkins user in Applcation server/s.
- I have used servers hosted on AWS (EC2) for this project, some codes needs to be changed depending on the OS you use.
### *__upcoming__*
- Ansible will collect metrics of docker and application server and store it on Jenkins server ( or some other server) 
- ELK stack or some monitoring tool can be utilized for monitoring and logs
- Load balancer can be used to distribute incoming traffic
- Database server to store user inputs in application
- Webapp that makes sense :laughing:. Current one is useless... I am not a dev AF. 
