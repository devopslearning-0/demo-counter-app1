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
        stage('Static Code Ananlysis by SonarQube'){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        bat 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('Quality gate Status'){
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
                }
            }
        }
        stage('Upload war file to nexus'){
            steps{
                script{

                    def readPomVersion = readMavenPom file: 'pom.xml'
                    
                    def nexusRepo = readMavenPom.version.endsWith("SNAPSHOT") ? "demoapp-snapshot" : "demoapp-release"

                    nexusArtifactUploader artifacts: 
                    [
                        [
                            artifactId: 'springboot', 
                            classifier: '', file: 'target/Uber.jar', 
                            type: 'jar'
                        ]
                    ], 
                    credentialsId: 'nexus-credentials', 
                    groupId: 'com.example', 
                    nexusUrl: 'localhost:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: nexusRepo, 
                    version: "${readPomVersion.version}"
                }
            }
        }
    }
        
}