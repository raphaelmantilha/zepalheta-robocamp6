pipeline {
    agent{
        docker{
            image 'qaninja/python-wd'
            args '--network=zepalheta-network'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'pip3 install robotframework'
                sh 'pip3 install robotframework-seleniumlibrary'
                sh 'pip3 install robotframework-requests==0.6.3'
                sh 'pip3 install psycopg2'
            }
        }
        // stage('API Test'){
        //     steps{
        //         sh 'robot -d ./logs/api tests/api'
        //     }
        // }
        stage('UI Tests'){
            steps{
                sh 'robot -d ./logs/web -vbrowser:headless tests/web'
            }
        }
    }
    post{
        always{
            robot archiveDirName: 'robot-plugin', disableArchiveOutput: true, logFileName: '**/log.html', otherFiles: '**/*.png,**/*.jpg', outputFileName: '**/output.xml', outputPath: 'logs', overwriteXAxisLabel: '', reportFileName: '**/report.html'
        }
    }
}