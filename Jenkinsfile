pipeline {
    agent any
    stages{
        stage('Dependencies'){
            steps{
                sh "bash jenkins/dependencies.sh"
            }
        }
        stage('Test'){
            steps{
                sh "bash jenkins/test.sh"
            }
        }
        stage('Build') {
            steps {
                sh "bash jenkins/build.sh"
            }
        }
        stage('Push Docker images') {
            steps {
                sh "bash jenkins/push.sh"
            }
        }
        stage('Deploy Cluster') {
            steps {
                sh "bash jenkins/cluster-deploy.sh"
            }
        }
        stage('Deploy') {
            steps{
                sh "bash jenkins/terraform.sh"
            }
        }
    }
}
