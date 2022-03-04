def gv
def NEXUS_SERVER

pipeline {
    agent any
    tools {
        maven "Maven"
    }

    stages {
        stage("init"){

            steps{
                script {
                    NEXUS_SERVER = "68.183.216.191:8082"
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
                    sh "docker build -t "hello_world:${params.VERSION}""
                    sh "docker tag "hello_world:${params.VERSION}" "${params.NEXUS_SERVER}/hello_world:${params.VERSION}""
                }
            }
        }

        stage("push image"){

            steps{
                script {
                    withCredentials([usernamePassword(credentialsId: 'nexus-repository', passwordVariable: 'PWD', usernameVariable: 'USER')]) {
                       sh "docker login -u $USER -p $PWD ${params.NEXUS_SERVER}"
                       sh "docker push "${params.NEXUS_SERVER}/hello_world:${params.VERSION}"" 
                    }
                }
            }
        }
    }
}