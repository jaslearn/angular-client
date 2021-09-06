pipeline {
    agent any
  //triggers {pollSCM('* * * * *')}
  stages {
    stage('Checkout') {
      steps {
        // Get some code from a GitHub repository
        git branch: "main", url: 'https://github.com/jaslearn/EmployeeREST-AngularClient.git'
      }
    }      
   stage('DockerBuild') {
      steps {
        sh 'docker build -t jasdhir/emp-angular:latest .'
      }
        }
         stage('DockerRun') {
      steps {
        sh 'docker run -d --rm -p 4200:50 jasdhir/emp-angular'
      }
        }
  }
}