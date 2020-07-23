1. Run terraform init and terraform apply commands in ./backend directory. You will need to provide several variables, either through console or .tfvars file. This creates S3        Bucket and DynamoDB which are used to store Terraform state remotely.<br>
   This step is necessary in order for the next steps to work properly.
2. Edit the variables present in main.tf file to your liking.
3. Edit the properties present in backend.tf file to your liking. Take note that Terraform does not allow variables in backend block - this needs to be hardcoded. 
4. Run terraform apply in the directory containing both main.tf and backend.tf file. For this to work properly, the infrastructure present in /backend directory has to be build.
