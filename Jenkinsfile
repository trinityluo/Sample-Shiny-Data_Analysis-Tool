pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        archiveArtifacts(artifacts: '*', defaultExcludes: true, excludes: 'Jenkinsfile')
      }
    }
  }
}