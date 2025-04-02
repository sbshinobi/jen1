pipeline{
    agent any
    stages{
        stage ("Build"){
            steps{
            sh "echo 'Building the application'"
            sh "docker build -t hello-world ."
            }
        }
        stage ("Test"){
            steps{
            sh "echo 'Testing the application' "
            sh "docker run hello-world python test_hello.py"
            }
        }
        stage ("Deploy"){
            steps{
            sh "echo 'Deploying the application'"
            sh "docker run -d --name hello-world-container hello-world"
            sh "docker logs hello-world-container"
        }
    }
        stage ("Push"){
            steps{
            sh "echo 'Pushing the application'"
            withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_CREDENTIALS', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                sh "docker push shinobisar/hello-world:latest"
            }
            
            }
        }
}
}