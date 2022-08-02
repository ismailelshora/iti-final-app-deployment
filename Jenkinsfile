pipeline {
    agent any
    environment {
        PROJECT_ID = 'ismail-354112'
        CLUSTER_NAME = 'jke'
        LOCATION = 'us-central1-a'
        CREDENTIALS_ID = 'ismail-ramadan'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }

    stage("Build image") {
            steps {
                script {
                    myapp = docker.build("ismailramadan/hello-pythonapp:${env.BUILD_ID}")
                }
            }
        }

    /*stage('Login-Into-Docker') {
      steps {
         withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {

                container('docker') {
          
                     sh 'docker login -u ${USERNAME} -p ${PASSWORD}'
                }
            }
     
        }
    }*/
       
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
        stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/hello:latest/hello:${env.BUILD_ID}/g' deployapp/appdeployment.yml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployapp/appdeployment.yml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }
}