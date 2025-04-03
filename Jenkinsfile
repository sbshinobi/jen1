pipeline{
    agent any
    environment{
        DOCKER_TAG = "${env.BUILD_NUMBER}"
    }
    stages{
        stage ("Build"){
            steps{
            sh "echo 'Building the application'"
            sh "docker build -t hello-world:${DOCKER_TAG} ."
            }
        }
        stage ("Test"){
            steps{
            sh "echo 'Testing the application' "
            sh "docker run hello-world:${DOCKER_TAG} python test_hello.py"
            }
        }
        
        stage ("Push"){
            steps{
            sh "echo 'Pushing the application'"
            withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_CREDENTIALS',  usernameVariable: 'DOCKER_USER',passwordVariable: 'DOCKER_PASS')]) {
                script{
                sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                sh 'docker tag hello-world:${DOCKER_TAG} $DOCKER_USER/hello-world:${DOCKER_TAG}'
                sh "docker push $DOCKER_USER/hello-world:${DOCKER_TAG}"

            }
            }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh 'pwd'  // Prints current directory
                    sh 'ls -la'  // Lists files in that dir
                    sh 'ls -la /home/ubuntu/.ansible/ || echo "Dir not found"'
                    sh "ansible-playbook -i /home/ubuntu/.ansible/hosts /home/ubuntu/.ansible/deploy.yml -e 'docker_tag=${DOCKER_TAG}'"
                }
            }
        }
}
}