pipeline{
    
    agent any 
    
    stages {
        
        stage('Git Checkout'){
            
            steps{
                    git branch: 'main', url: 'https://github.com/devopslearning-0/demo-counter-app1.git'
            }
        }
        stage('Unit Testing'){
            
            steps{
                bat 'mvn test'
            }
        }
        stage('Integration Test'){
            
            steps{
                bat 'mvn verify -DskipUnitTests'
            }
        }
        stage('Maven Build / creating Artifacts'){
            
            steps{
                bat 'mvn clean install'
            }
        }
    }
        
}