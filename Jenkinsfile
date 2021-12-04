pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/rushabhmahale/jenkwebui-deployment.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("rushabh21/jenk1:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub1') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
    stage('Apply Kubernetes files') {
       steps {
                withKubeConfig([credentialsId: 'e48c0eb4-b262-4ba5-9e44-3a106b2a03c2']) {
                sh 'kubectl apply -f hellowhale1.yml'
                }
    }

   }

  }

}


