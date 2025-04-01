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
            sh "docker run hello-world python test.py"
            }
        }
        stage ("Deploy"){
            steps{
            sh "echo 'Deploying the application'"
            sh "docker run -d --name hello-world-container hello-world"
            sh "docker logs hello-world-container"
        }
    }
}
}