pipeline{
    
    agent any 
    
    stages {
        
        stage('Git Checkout'){
            
            steps{
                
                script{
                    
                    git branch: 'main', url: 'https://github.com/devopslearning-0/demo-counter-app1.git'
                }
            }
        }
        
        }
        
}