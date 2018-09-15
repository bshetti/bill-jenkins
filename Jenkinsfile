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
          sh 'docker build -t dillson/jw-workshop:latest .'
        }
      }
    }
    stage('Docker Push') {
      steps {
        container('docker'){
          withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'docker push dillson/jw-workshop:latest'
          }
        }
      }
    }
    stage('Deploy to Staging Server') {
      steps {
        container('vke-kubectl'){
          withCredentials([usernamePassword(credentialsId: 'VCS', usernameVariable: 'orgID', passwordVariable: 'apiToken')]) {
            sh "vke account login -t ${env.orgID} -r ${env.apiToken}"
            sh '''
                 vke cluster merge-kubectl-auth cloudbees-ingress
                 sleep 5
                 kubectl create namespace jw-workshop
                 kubectl run jw-workshop-build --image=dillson/jw-workshop:latest --port 8080 --namespace jw-workshop
                 kubectl expose deployment jw-workshop-docker-build --type=NodePort --port 30480 --target-port 8080 --namespace jw-workshop
                 echo "Web Server Launched!"
            '''
          }
        }
      }
    }
  }
<<<<<<< HEAD
}

=======
}
>>>>>>> c87376742b5f3b475641b6467627c5711e05b7e4
