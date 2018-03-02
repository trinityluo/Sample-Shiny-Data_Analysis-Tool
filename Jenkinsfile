pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        archiveArtifacts(artifacts: '**/*', defaultExcludes: true, excludes: 'Jenkinsfile')
      }
    }
    stage('Development') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'jenkins@gcp', transfers: [sshTransfer(excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: true, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'shiny-server/shinyapps/sample-shiny-analysis-tool1', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'ui.R')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
      }
    }
  }
  environment {
    projectName = 'sample-shiny-analysis-tool'
    remotePath = 'shiny-server/shinyapps'
  }
}