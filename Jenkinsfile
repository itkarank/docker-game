pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/itkarank/docker-game'
            }
        }

       stage('Docker Build & Push') {
            steps {
                script{

                    
                    withDockerRegistry(credentialsId: '4dc60544-f54b-48cd-ad44-bd685badc389', toolName: 'docker-game') {
                        
                        sh "docker build -t react-project -f Dockerfile ."
                        sh "docker tag  docker-game karan143/docker-game:latest"
                        sh "docker push karan143/docker-game:latest"
                    }
                }
            }
        }    
        
        stage('Docker Deploy to Container') {
            steps {
                script {
                withDockerRegistry(credentialsId: '4dc60544-f54b-48cd-ad44-bd685badc389', toolName: 'docker-game') {
                    sh "docker run -d --name docker-game -p 8070:8070 karan143/docker-game:latest" }
                }
                
            }
        }
    }
}
