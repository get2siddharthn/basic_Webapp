pipeline {
    agent any
    
    //env variables
    environment {
        DOCKER_TAG = getVersion()
    }

    stages {
        stage('SCM') {
            //Detect changes to github repository using webhooks
            steps {
                git branch: 'main', url: 'https://github.com/get2siddharthn/basic_Webapp.git'
            }
        }
        
        stage('docker build') {
            //Build image; name:webapp 
            steps {
                sh "docker build . -t sidverse/webapp:${DOCKER_TAG}"
            }
        }
        
        stage('docker push') {
            //Login to dockerhub using credential dockerHubP stored in Jenkins and push built image to dockerhub
            steps {
                withCredentials([string(credentialsId: 'docker_hub', variable: 'dockerHubP')]) {
                sh "docker login -u sidverse -p ${dockerHubP}"
                }
                
                sh "docker push sidverse/webapp:${DOCKER_TAG}"
            }
        }
        
        stage('ansible deploy') {
            //user docker_deploy.yaml as ansible playbook to deploy created image to server
            steps {
                ansiblePlaybook credentialsId: 'ansible_dev', disableHostKeyChecking: true, extras: '-e DOCKER_TAG=${DOCKER_TAG}', installation: 'ansible', inventory: 'dev.inv', playbook: 'docker_deploy.yaml'
            }
        }
    }
}

def getVersion() {
    def gitVersion = sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return gitVersion
}