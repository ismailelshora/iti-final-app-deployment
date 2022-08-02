#!groovy
pipeline {
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
                 withKubeConfig([namespace: "app", credentialsId: 'ismail-ramadan']){
                sh 'kubectl apply -Rf ./deployapp' }
            }}
        }
    }
