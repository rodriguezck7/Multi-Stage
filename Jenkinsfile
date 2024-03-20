pipeline {
    agent any 
    stages {
        stage('Construct Dev Image') {
            steps {
                script {
                    sh "docker build -t $DEV_IMAGE --target dev ."
                }
            }
        }
        stage('Run Pytest') {
            steps {
                script {
                    sh "docker run --rm $DEV_IMAGE pytest"
                }
            }
        }
    }
} 