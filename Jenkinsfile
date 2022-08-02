#!groovy
pipeline {

    environment {
    PROJECT = "ismail-354112"
    APP_NAME = "hello-pythonapp"
    CLUSTER = "jke"
    CLUSTER_ZONE = "us-central1-a"
    JENKINS_CRED = "${PROJECT}"
  }

  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: python
            image: python:3.9-alpine
            command:
            - cat
            tty: true
          - name: docker
            image: docker:latest
            command:
            - cat
            tty: true
            volumeMounts:
             - mountPath: /var/run/docker.sock
               name: docker-sock
          volumes:
          - name: docker-sock 
            hostPath:
              path: /var/run/docker.sock 
          - name: kubectl-config
            hostPath:
              path: /var/jenkins_home/.kube/config 
              
            
        '''
    }
  }


    agent any
    stages {           
        stage('Build app') {
            steps {
                sh 'docker build -t hello-pythonapp:latest -f Dockerfile .'}
            }
        stage('tagging the image') {
            steps {
                sh 'docker tag hello-pythonapp:latest ismailramadan/hello-pythonapp'}
            }
       stage('push the image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push ismailramadan/hello-pythonapp'   }
                }
            }
        stage('app deploy') {
            steps {
                 withKubeConfig([namespace: "default", credentialsId: 'jke']){
                sh 'kubectl apply -Rf ./deployapp' }
            }}
        }
    }
