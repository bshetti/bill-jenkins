pipeline {
  agent {
    label 'jw-docker'
    }
  stages {
    stage('Docker Build') {
      steps {
        container('docker'){
          sh 'docker build -t bshetti/sample-app .'
        }
      }
    }
    stage('Docker Push') {
      steps {
        container('docker'){
          withCredentials([usernamePassword(credentialsId: 'bshettiDockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'docker push bshetti/sample-app'
          }
        }
      }
    }
  }
}

