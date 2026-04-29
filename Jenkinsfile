pipeline {
agent any

stages {

stage('Clone') {
steps {
git branch: 'main',
url: 'https://github.com/humaira0316/cicd-sonarqube-poc.git'
}
}

stage('Install Dependencies') {
steps {
sh 'pip3 install -r requirements.txt'
}
}

stage('Sonar Scan') {
steps {
withSonarQubeEnv('sonar-server') {
sh '''
sonar-scanner \
-Dsonar.projectKey=demo-app \
-Dsonar.sources=. \
-Dsonar.login=$SONAR_AUTH_TOKEN
'''
}
}
}

stage('Docker Build') {
steps {
sh 'docker build -t demoapp .'
}
}

stage('Deploy') {
steps {
sh '''
docker stop demo || true
docker rm demo || true
docker run -d -p 5000:5000 --name demo demoapp
'''
}
}

}

}
