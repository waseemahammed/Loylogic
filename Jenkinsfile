pipeline { 
    agent any 
    environment {
       JAVA_VERSION  = "jdk11"
       BUILD_COMMAND = "mvn clean install -DskipTests"
   }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/waseemahammed/Loylogic.git']]])

            }
        }
        stage("Build"){
            tools {
                jdk "${env.JAVA_VERSION}" 
            }
            steps{
                echo "Running build automation"
                script{
                    sh "mvn clean install -DskipTests"
                }
            }
        }
        stage("Build docker image and Push to repo"){
            environment {
                DOCKER_IMAGE_NAME = "waseemahammed/loylogic"
                registryCredential = 'docker-hub-waseem'
            }
            steps{
                script{
                   app = docker.build DOCKER_IMAGE_NAME + ":" + "$BUILD_NUMBER"
                    docker.withRegistry('',registryCredential){
                    app.push()
                    }
                }
            }
        }
        stage("Deploy to EC2"){
            environment {
                CFN_STACK_NAME = "deployment-server-stack"
            }
            steps{
                withAWS(role:'role-name', roleAccount:'account-id', roleSessionName: 'CFN-deployment-session') {
                    cfnUpdate(stack:"${env.CFN_STACK_NAME}", file:"Cloudformation/private-servers.json", paramsFile:"Cloudformation/private-servers-parameters.json")
                }
            }
        }
    }
}