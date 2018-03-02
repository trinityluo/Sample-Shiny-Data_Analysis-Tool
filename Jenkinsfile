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
        sshPublisher(publishers: [sshPublisherDesc(configName: 'jenkins@gcp', transfers: [sshTransfer(excludes: '', execCommand: '''mkdir -p /mnt/disks/data/shiny-server/shinyapps/sample-shiny-analysis-tool
cd /mnt/disks/data/shiny-server/shinyapps/sample-shiny-analysis-tool''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: ''), sshTransfer(excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'archive', sourceFiles: 'archive/**/*')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
      }
    }
  }
}
