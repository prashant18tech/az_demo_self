pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo "📦 Checking out source code..."
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'AZURE_SUBSCRIPTION_ID', variable: 'TF_VAR_azure_subscription_id'),
                    string(credentialsId: 'AZURE_CLIENT_ID', variable: 'TF_VAR_azure_client_id'),
                    string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'TF_VAR_azure_client_secret'),
                    string(credentialsId: 'AZURE_TENANT_ID', variable: 'TF_VAR_azure_tenant_id')
                ]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    string(credentialsId: 'AZURE_SUBSCRIPTION_ID', variable: 'TF_VAR_azure_subscription_id'),
                    string(credentialsId: 'AZURE_CLIENT_ID', variable: 'TF_VAR_azure_client_id'),
                    string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'TF_VAR_azure_client_secret'),
                    string(credentialsId: 'AZURE_TENANT_ID', variable: 'TF_VAR_azure_tenant_id')
                ]) {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    string(credentialsId: 'AZURE_SUBSCRIPTION_ID', variable: 'TF_VAR_azure_subscription_id'),
                    string(credentialsId: 'AZURE_CLIENT_ID', variable: 'TF_VAR_azure_client_id'),
                    string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'TF_VAR_azure_client_secret'),
                    string(credentialsId: 'AZURE_TENANT_ID', variable: 'TF_VAR_azure_tenant_id')
                ]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Resource group created successfully!"
        }
        failure {
            echo "❌ Terraform pipeline failed. Check the logs."
        }
    }
}
