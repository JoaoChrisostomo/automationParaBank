pipeline {
    agent {
        dockerfile {
            args "--shm-size=512m"
        }
    }
    stages {
        stage('build') {
            steps {
                sh "rm -f Gemfile.lock"
                sh "rm -rf ~/.bundle/cache"
                sh "bundle install"
            }
        }
        stage('Run features') {
            steps {
                script {
                   try {
                        sh "bundle exec cucumber -p $environment -p $device -p headless -p json_report -t$tag"
                   } finally {
                        cucumber fileIncludePattern: '**/*.json', jsonReportDirectory: 'reports', sortingMethod: 'ALPHABETICAL'
                        cleanWs()
                   }
                }
            }
        }
    }
}
