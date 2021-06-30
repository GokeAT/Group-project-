pipeline {
    agent any
    stages{
        stage('Setup'){
            steps{
                sh "bash jenkins/dependencies.sh"
            }
        }
        stage('Test'){
            steps{
                sh "bash jenkins/test.sh"
            }
        }
        stage('Deploy') {
            steps {
                sh "bash jenkins/build.sh"
            }
        }
    }
}
