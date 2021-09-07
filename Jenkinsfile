pipeline {
    agent any
  //triggers {pollSCM('* * * * *')}
  stages {
    stage('Checkout') {
      steps {
        // Get some code from a GitHub repository
        git branch: "main", url: 'https://github.com/jaslearn/angular-client.git'
      }
    }      
   stage('DockerBuild') {
      steps {
        sh 'docker build -t jasdhir/emp-angular:latest .'
      }
        }
         stage('DockerRun') {
      steps {
        sh 'docker run -d --rm -p 9090:80 jasdhir/emp-angular'
      }
        }
  }
}