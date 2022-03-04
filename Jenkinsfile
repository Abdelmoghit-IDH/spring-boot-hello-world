def gv
def NEXUS_SERVER

pipeline {
    agent any
    tools {
        maven: "Maven"
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
                    mvn package
                }
            }
        }

        stage("build image"){
            steps{
                script {
                    docker build -t "hello_world:${params.VERSION}"
                    docker tag "hello_world:${params.VERSION}" "${params.NEXUS_SERVER}:${params.VERSION}"
                }
            }
        }

        stage("push image"){

            steps{
                script {
                    withCredentials([usernamePassword(credentialsId: 'nexus-repository', passwordVariable: 'PWD', usernameVariable: 'USER')]) {
                        docker login -u $USER -p $PWD ${params.NEXUS_SERVER}
                    }
                }
            }
        }
    }
}