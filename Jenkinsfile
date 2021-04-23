pipeline { 
    agent any 
    environment {
       JAVA_VERSION  = "jdk11"
       BUILD_COMMAND = "mvn clean install -DskipTests"
   }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/spring-projects/spring-petclinic.git']]])

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
        stage("Build docker image"){
            environment {
                DOCKER_IMAGE_NAME = "test"
                DOCKER_REGISTRY_PATH = "http://" + "${env.DOCKER_REGISTRY_DEV}" + "${env.registry}"
                DOCKER_TAG = "test"
            }
            steps{
                echo "Running build automation"
                script{
                    app = docker.build(DOCKER_IMAGE_NAME + ":" + DOCKER_TAG)
                }
            }
        }
    }
}