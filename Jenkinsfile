pipeline {
    agent {label 'Deploy'}
    stages {
        stage('my Build') {
            steps {
                sh 'rm -rf myapp'
                sh 'git clone "https://github.com/jnanaswaroopkr/myapp.git"'
                sh 'chmod -R 777 myapp'
                dir('/home/swaroop/myapp') {
                    sh 'docker build -t tomcat_build:1.0 .' 
                }
            }
        }  
        stage('publish stage') {
            steps {
                sh 'docker login -u jnanaswaroop -p kavyaswaroop'
                sh 'docker tag tomcat_build:1.0 jnanaswaroop/tomcat:1.1.6'
                sh 'docker push jnanaswaroop/tomcat:1.1.6'
            }
        } 
        stage( 'my deploy' ) {
            steps {
                sh 'docker pull jnanaswaroop/tomcat:1.1.6'
                sh 'docker rm -f mytomcat'
                sh 'docker run -d -p 8080:9090 --name mytomcat jnanaswaroop/tomcat:1.1.6'
            }
        }    
    } 
}
