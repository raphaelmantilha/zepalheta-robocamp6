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
                sh 'pip3 install robotframework-requests'
                sh 'pip3 install psycopg2'
            }
        }
        stage('API Test'){
            steps{
                sh 'robot -d ./logs tests/api'
            }
        }
        stage('UI Tests'){
            steps{
                sh 'robot -d ./logs tests/web'
            }
        }
    }
    post{
        always{
            robot archiveDirName: 'robot-plugin', outputPath: 'logs', overwriteXAxisLabel: ''
        }
    }
}