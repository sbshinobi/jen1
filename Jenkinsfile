pipeline{
    agent any
    stages{
        stage ("Build"){
            steps{
            sh "echo 'Building the application'"
            sh "python3 hello.py"
            }
        }
        stage ("Test"){
            steps{
            sh "echo 'Testing the application' "
            sh "python3 test_hello.py > output.txt"
            }
        }
        stage ("Deploy"){
            steps{
            sh "echo 'Deploying the application'"
            sh "copy output.txt deployed.txt"
            sh "cat deployed.txt"
        }
    }
}
}