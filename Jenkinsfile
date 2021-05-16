
pipeline {
  agent any
  stages {
  
  stage('Maven Installation')
    {
    steps{
        echo "Building the checked out project...";
        bat "mvn clean install";
        }
    }
    }
}
