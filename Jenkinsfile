pipeline {
    agent any

    environment {
        // Azure credentials (stored as Jenkins secrets)
        AZURE_CLIENT_ID       = credentials('AZURE_CLIENT_ID')
        AZURE_CLIENT_SECRET   = credentials('AZURE_CLIENT_SECRET')
        AZURE_TENANT_ID       = credentials('AZURE_TENANT_ID')
        AZURE_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo "Checking out code from GitHub repository..."
                // ✅ Correct repository URL
                git branch: 'main',
                    url: 'https://github.com/prashant18tech/az_demo_self.git'
            }
        }

        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform..."
                sh '''
                    terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "Running Terraform plan..."
                sh '''
                    terraform plan -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Do you want to apply the Terraform changes?", ok: "Apply"
                echo "Applying Terraform configuration..."
                sh '''
                    terraform apply -auto-approve tfplan
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment completed successfully!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
        always {
            echo "Pipeline execution completed."
        }
    }
}
