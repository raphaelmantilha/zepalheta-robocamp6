pipeline {
    agent{
        docker{
            image 'python'
            args '--network=zepalheta-network'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'pip install robotframework'
                sh 'pip install robotframework-seleniumlibrary'
                sh 'pip install robotframework-requests'
                sh 'pip install psycopg2'
            }
        }
        stage('API Test'){
            steps{
                sh 'robot -d ./logs tests/api'
                robot archiveDirName: 'robot-plugin', outputPath: 'logs', overwriteXAxisLabel: ''
            }
        }
    }
}