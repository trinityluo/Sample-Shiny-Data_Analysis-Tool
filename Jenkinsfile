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
        sshPublisher failOnError: true, publishers: [sshPublisherDesc(configName: 'jenkins@gcp', transfers: [sshTransfer(excludes: '', execCommand: 'pwd', execTimeout: 120000, flatten: false, makeEmptyDirs: true, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'shiny-server/shinyapps/sample-shiny-analysis-tool', remoteDirectorySDF: false, removePrefix: 'archive', sourceFiles: 'archive/**/*')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)]
      }
    }
  }
}
