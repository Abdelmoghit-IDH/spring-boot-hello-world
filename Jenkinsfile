def gv
def NEXUS_SERVER
def VERSION

pipeline {
    agent any
    tools {
        maven "Maven"
    }

    stages {
        stage("init"){

            steps{
                script {
                    VERSION = "1.1"
                    NEXUS_SERVER = "68.183.216.191:8081"
                }
            }
        }

        stage("build project"){

            steps{
                script {
                    sh 'mvn package'
                }
            }
        }

        stage("build image"){
            steps{
                script {
                    sh "docker build -t 'hello_world:${VERSION}' ."
                    sh "docker tag 'hello_world:${VERSION}' '${NEXUS_SERVER}/hello_world:${VERSION}'"
                }
            }
        }

        stage("push image"){

            steps{
                script {
                    withCredentials([usernamePassword(credentialsId: 'nexus-repository', passwordVariable: 'PWD', usernameVariable: 'USER')]) {
                       sh "docker login -u ${USER} -p ${PWD} ${NEXUS_SERVER}"
                       sh "docker push '${NEXUS_SERVER}/hello_world:${VERSION}'" 
                    }
                }
            }
        }
    }
}