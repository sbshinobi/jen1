pipeline{
    agent any
    stages{
        stage ("Build"){
            steps{
            sh "echo 'Building the application'"
            sh "sudo docker build -t hello-world ."
            }
        }
        stage ("Test"){
            steps{
            sh "echo 'Testing the application' "
            sh "sudo docker run hello-world python test_hello.py"
            }
        }
        stage ("Deploy"){
            steps{
            sh "echo 'Deploying the application'"
            sh "sudo docker run -d --name hello-world-container hello-world"
            sh "sudo docker logs hello-world-container"
        }
    }
}
}