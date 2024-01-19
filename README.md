# Automated AWS Infrastructure & Deployment with Terraform and GitHub Actions

This project showcases an automated infrastructure provisioning and deployment workflow for a simple website on AWS using Terraform and GitHub Actions.

## Infrastructure Components!
<img src="https://github.com/KunalBhat55/Terraform-Automate/assets/98662328/6c415fb3-a0d7-4e11-ab25-d8112f541392" alt="Alt text" >


* **VPC:** A virtual private cloud to isolate your resources within a dedicated network.
* **EC2 Instance:** An Amazon Linux 2 instance running a web server (Apache) to host your website.
* **Security Groups:** Control inbound and outbound traffic for your resources.
* **Application Load Balancer (ALB):** Distributes traffic across your EC2 instances for high availability.
* **S3 Bucket:** Stores Terraform state and potentially your website assets.


## Deployment Workflow

1. **Push code to GitHub:** Any changes to your Terraform configuration or website files trigger the workflow.
2. **GitHub Actions kicks off:** The defined workflow in `.github/workflows` initiates the build and deployment process.
3. **Terraform Build & Apply:**
    * **Build:** The workflow validates and plans the Terraform configuration changes.
    * **Apply:** If everything is validated, the changes are applied to your AWS account, creating or updating the infrastructure.
4. **Website Deployment:**
    * **Installing Nginx:** Installing nginx server on both the instances using a shell script which is passed as a user_data in terraform configuration
    * **ALB configuration:** Configuring ALB in a way that it routes traffic to target groups containing our ec2 instances 

## Project Highlights

* **Infrastructure as Code (IaC):** Terraform defines your infrastructure in code, ensuring consistency and repeatability.
* **CI/CD Pipeline:** Automated deployments with GitHub Actions streamline the development and release process.
* **Scalability and Availability:** The ALB distributes traffic across EC2 instances for increased scalability and fault tolerance.
* **Modular Approach:** Infrastructure components are defined in separate Terraform modules for better organization and reusability.

## Getting Started

1. Clone this repository to your local machine.
2. Configure your AWS credentials and region in the appropriate files.
3. Review and customize the Terraform configuration and GitHub Actions workflow as needed.
4. Push your changes to GitHub to trigger the deployment pipeline.

## Additional Resources

* Terraform Documentation: [https://www.terraform.io/](https://www.terraform.io/)
* GitHub Actions Documentation: [https://docs.github.com/actions](https://docs.github.com/actions)
* AWS Documentation: [https://docs.aws.amazon.com/](https://docs.aws.amazon.com/)
