pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                url: 'https://github.com/humaira0316/cicd-sonarqube-poc.git'
            }
        }

        stage('Sonar Scan') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''
                    /opt/sonar-scanner/bin/sonar-scanner \
                    -Dsonar.projectKey=html-poc \
                    -Dsonar.sources=. \
                    -Dsonar.login=$SONAR_AUTH_TOKEN
                    '''
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t html-poc .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop html-container || true
                docker rm html-container || true
                docker run -d -p 8081:80 --name html-container html-poc
                '''
            }
        }

    }
}
