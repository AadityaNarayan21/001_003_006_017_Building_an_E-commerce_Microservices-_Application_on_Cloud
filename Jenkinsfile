pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Hardcoded Docker credentials
                    def DOCKER_USERNAME = "aaditya21"
                    def DOCKER_PASSWORD = 'Aaditya2003'
                    
                    // Build and push Docker images
                    bat 'docker build -t user ./user'
                    bat 'docker login -u ' + DOCKER_USERNAME + ' -p ' + DOCKER_PASSWORD + ' docker.io'
                    bat 'docker tag user ' + DOCKER_USERNAME + '/user:latest'
                    bat 'docker push ' + DOCKER_USERNAME + '/user:latest'
                    
                    bat 'docker build -t product ./product'
                    bat 'docker tag product ' + DOCKER_USERNAME + '/product:latest'
                    bat 'docker push ' + DOCKER_USERNAME + '/product:latest'
                    
                    bat 'docker build -t order ./order'
                    bat 'docker tag order ' + DOCKER_USERNAME + '/order:latest'
                    bat 'docker push ' + DOCKER_USERNAME + '/order:latest'
                    
                    dir("frontend") {
                        bat 'docker build -t frontend .'
                        bat 'docker tag frontend ' + DOCKER_USERNAME + '/frontend:latest'
                        bat 'docker push ' + DOCKER_USERNAME + '/frontend:latest'
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy Kubernetes resources
                // bat 'kubectl config use-context minikube'
                bat 'kubectl apply -f kubernetes.yaml'
                echo 'Success'

                
            }
        }
    }
    
    post {
        failure {
            // Print message if pipeline fails
            echo 'Pipeline failed'
        }
    }
}
