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
    }
}
