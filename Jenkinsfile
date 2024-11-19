pipeline {
    agent any  

    environment {
        DOCKER_REGISTRY = 'docker.io' // Docker registry (Docker Hub by default)
        DOCKER_IMAGE = 'ws111994/jenkinslab' // Replace with your Docker Hub repo
    }

    stages {
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                sh 'docker build -t $DOCKER_IMAGE:${BUILD_NUMBER} .'
            }
        }

        stage('Push Docker Image') {
            steps {
                // Log in to Docker Hub and push the image
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials', // Jenkins credentials ID for Docker Hub
                    usernameVariable: 'ws111994',
                    passwordVariable: 'ws19941119'
                )]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin $DOCKER_REGISTRY'
                    sh 'docker push $DOCKER_IMAGE:${BUILD_NUMBER}'
                }
            }
        }
    }

    

    post {
        always {
            echo "Cleaning up local Docker images"
            sh 'docker rmi $DOCKER_IMAGE:${BUILD_NUMBER} || true'
        }
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Build or push failed. Check logs for details.'
        }
    }
}





