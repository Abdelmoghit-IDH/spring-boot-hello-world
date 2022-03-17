def NEXUS_SERVER

pipeline {
    agent any
    tools {
        maven "Maven"
    }

    stages {
        stage("Init"){

            steps{
                script {
                    NEXUS_SERVER = "68.183.216.191:8082"
                }
            }
        }

        stage("Test project"){

            steps{
                script {
                    sh 'mvn test'
                }
            }
        }
    }
}