README.md
markdown
CopierModifier
#  Static Website Deployment on AWS using Terraform

This project demonstrates how to deploy a static website to AWS S3 using Terraform. It includes the setup of a public S3 bucket, upload of static files (`index.html` and images), and configuration for website hosting. The infrastructure is defined as code using Terraform.

---

##  Features

- Creates an S3 bucket with website hosting enabled
- Uploads `index.html` and image assets to the bucket
- Sets public access and bucket policy
- Configures the S3 bucket as a static website
- Uses Terraform for reproducible infrastructure

---

##  Project Structure

  ```
  .
   ├── main.tf
   ├── variables.tf # Input variables
   ├── versions.tf # Terraform version and provider requirements
   ├── website/ # Static site files (HTML, images, CSS, etc.)
   │ ├── index.html
   │ └── cumulus.jpg
   └── .gitignore 
  ```

---

## Requirements

- Terraform >= 1.3.0
- AWS CLI (configured with access keys or profile)
- An AWS account with permissions to manage S3

---

##  How to Use

1. **Initialize Terraform:**
     ```bash
     terraform init

2. **Preview changes:**
     ```bash
     terraform plan

3. **Apply the configuration:**
     ```bash
      terraform apply -auto-approve

4. **View your site:**
   
     Terraform will output the website URL at the end. Open it in your browser.

5. **Cleanup:**

    To remove the infrastructure:
     ```bash
      terraform destroy -auto-approve

6. **Example:**

   ![Cumulus Image](website/cumulus.jpg)

7. **License**

   MIT


