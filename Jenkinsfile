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
        sshPublisher(publishers: [sshPublisherDesc(configName: 'jenkins@gcp', transfers: [sshTransfer(excludes: '', execCommand: 'pwd', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'shiny-server/shinyapps/sample-shiny-analysis-tool', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'ui.R')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])

      }
    }
  }
}
