pipeline {
  agent {
    kubernetes {
        label 'docker-build-pod'
        yamlFile 'podTemplate/jw-workshop-docker-build.yaml'
    }
  }
  stages {
    stage('Docker Build') {
      steps {
        container('docker'){
          sh 'docker build -t dillson/sample-app .'
        }
      }
    }
    stage('Docker Push') {
      steps {
        container('docker'){
          withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'docker push dillson/sample-app'
          }
        }
      }
    }
  }
}

