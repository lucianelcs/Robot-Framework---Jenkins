pipeline {
   agent {
       docker {
           image 'qaninja/pyrobot2'
           args '--network=skynet'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Baixando as depedências do projeto'
            sh 'pip install -r requirements.txt'
         }
      }
      stage('Test') {
         steps {
            echo 'Executando testes de regressão'
            sh 'python -m robot  -d ./results ./tests'
         }
         post {
            always {
               robot 'logs'
            }
         }
      }
      stage('UAT') {
         steps {
            echo 'Aprovação dos testes de aceitação' 
         } 
      }
      stage('Production') {
         steps {
            echo 'Ok em produção!'
         } 
      }
   }
}
