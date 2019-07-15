pipeline {
    agent none
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.5.3'
                }
            }
            steps {
                sh 'mvn clean install -U'
            }
        }
        stage('Docker build') {
            agent any
            steps {
                sh "docker build -t sahirug/hello-world:v${env.BUILD_NUMBER} ."
            }
        }
        stage('Docker push') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                    sh "docker push sahirug/hello-world:v${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
