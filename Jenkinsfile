pipeline {
    agent any
    environment { 
        DOCKER_TAG = "${env.BUILD_NUMBER}" 
    }
    stages {
        stage('Build') { 
            steps { 
                sh "docker build -t my-app:${DOCKER_TAG} ." 
            } 
        }
        // stage('Test') { 
        //     steps { 
        //         sh "docker run my-app:${DOCKER_TAG} python test.py" 
        //     } 
        // }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER-HUB-CREDENTIALS', 
                                                 usernameVariable: 'DOCKER_USER', 
                                                 passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh "docker tag my-app:${DOCKER_TAG} $DOCKER_USER/my-app:${DOCKER_TAG}"
                    sh "docker push $DOCKER_USER/my-app:${DOCKER_TAG}"
                }
            }
        }
        stage('Deploy') {
            environment { 
                DOCKER_PASS_ENV = credentials('DOCKER-HUB-CREDENTIALS') // Use secret directly
            }
            steps {
                sh 'ansible-playbook -i ansible/hosts ansible/deploy.yml -e "docker_tag=${DOCKER_TAG} DOCKER_PASS=${DOCKER_PASS_ENV}"'
            }
        }
    }
}