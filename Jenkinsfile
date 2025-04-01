pipeline{
    agent any
    stages{
        stage ("Build"){
            sh "echo 'Building the application'"
            sh "python3 hello.py"
        }
        stage ("Test"){
            sh "echo 'Testing the application' "
            sh "python3 test_hello.py"
        }
        stage ("Deploy"){
            sh "echo 'Deploying the application'"
        }
    }
}