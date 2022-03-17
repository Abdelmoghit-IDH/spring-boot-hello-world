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
                    echo "Building $BRANCH_NAME"
                }
            }
        }

        stage("Test project"){

            steps{
                script {
                    echo "Testing $BRANCH_NAME"
                    sh 'mvn test'
                }
            }
        }
    }
}