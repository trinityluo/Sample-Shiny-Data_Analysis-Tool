pipeline {
  agent any
  environment {
    projectName = 'sample-shiny-analysis-tool'
    remotePath = '/mnt/disks/data/shiny-server/shinyapps'
  }
  stages {
    stage('Build') {
      steps {
        archiveArtifacts(artifacts: '**/*', defaultExcludes: true, excludes: 'Jenkinsfile')
      }
    }
    stage('Development') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'jenkins@gcp', transfers: [sshTransfer(excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: true, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: "${remotePath}/${projectName}", remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*'), sshTransfer(excludes: '', execCommand: "docker exec -it shiny-server /bin/bash\nsudo su docker\ncd /srv/shiny-server/${projectName}\nRscript -e 'packrat::restore()'\ntouch restart.txt", execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])


      }
    }
  }
  
}
