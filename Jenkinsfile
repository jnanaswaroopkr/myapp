pipeline {
    agent {label 'Deploy'}
    stages {
        stage('my Build') {
            steps {
                sh 'rm -rf myapp'
                sh 'git clone "https://github.com/jnanaswaroopkr/myapp.git"'
                sh 'chmod -R 777 myapp'
                sh 'pwd'
                dir('/home/swaroop/workspace/Demo-project/myapp') {
                    sh 'pwd'
                    sh 'docker build -t tomcat_build:1.0 .' 
                }
            }
        }  
        stage('publish stage') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'DockerhubPassword', usernameVariable: 'DockerhubUser')]) {
                sh "docker login -u ${env.DockerhubUser} -p ${env.DockerhubPassword}"
                sh 'docker tag tomcat_build:1.0 jnanaswaroop/tomcat:1.1.7'
                sh 'docker push jnanaswaroop/tomcat:1.1.7'
                }
            }
        } 
        stage( 'my deploy' ) {
            agent {label 'Slave1'}
            steps {
                sh 'docker pull jnanaswaroop/tomcat:1.1.7'
                sh 'docker rm -f mytomcat'
                sh 'docker run -d -p 8010:8080 --name mytomcat jnanaswaroop/tomcat:1.1.7'
            }
        }    
    } 
}
