#!groovy
pipeline {

    environment {
    PROJECT = "ismail-354112"
    APP_NAME = "hello-pythonapp"
    CLUSTER = "jke"
    CLUSTER_ZONE = "us-central1-a"
    JENKINS_CRED = "${PROJECT}"
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
        stage('Deploy-To-Production') {
      // run the the deploy stage on master node
        agent { label 'master' }
        steps {
           echo "======== Deploy-Stage ========"
          withKubeConfig([namespace: "default", credentialsId: 'jke']) {
             sh 'kubectl apply -f ./deployapp/namespace.yaml'
             sh 'kubectl apply -Rf ./deployapp/ -n default'
        }
        }   
      }
  }



      /*  stage('app deploy') {
            steps {
                 withKubeConfig([namespace: "default", credentialsId: 'jke']){
                sh 'kubectl apply -Rf ./deployapp' }
            }}
        }*/
    }
