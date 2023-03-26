# Terraform scripts for a Heroku/AWS WordPress app

This repo accompanies the blog post series [Terraforming a WordPress site on Heroku and AWS](https://leeaplin.com/posts/heroku-aws-terraform)

## Terraform commands
- `terraform init` - Initialise terraform and install required modules/providers
- `terraform fmt` - Lint your scripts
- `terraform validate` - Check for any common errors or problems
- `terraform plan --out=unique-identifier-here` - Create a plan of the resources that will be provisioned based on your script
- `terraform apply "unique-identifier-here"` - Apply the plan and provision your resources
