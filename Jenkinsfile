podTemplate(containers: [
    containerTemplate(name: 'terraform', image: 'hashicorp/terraform', ttyEnabled: true, command: 'cat')
  ]) {

    


    node(POD_LABEL) {  

      environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  
    stage('Checkout') {
        checkout scm
        sh 'mkdir -p creds' 
        sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/serviceaccount.json'
    }

    stage('TF Plan') {
        container('terraform') {
          sh 'terraform init'
          sh 'terraform plan -out myplan'
        }
    }

    stage('Approval') {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
   }

    stage('TF Apply') {
        container('terraform') {
          sh 'terraform apply -input=false myplan'
        }
    }


}
  }
