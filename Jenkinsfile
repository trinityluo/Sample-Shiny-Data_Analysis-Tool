pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        git(url: 'https://github.com/trinityluo/Sample-Shiny-Data_Analysis-Tool.git', branch: 'develop', credentialsId: 'github', changelog: true)
      }
    }
  }
}