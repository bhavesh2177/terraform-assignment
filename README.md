## Prerequisite: ##
1. You must have terraform client installed on your system.
2. Make sure you are having AWS **Access/Secret key** handy to deploy the infrastructure in the AWS cloud.


## Steps: ##
1. Export the AWS Access and Secret Key as given below.
```
$ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ export AWS_DEFAULT_REGION=us-west-2
```

2. Verify the AWS user that has right set of permission to build the infrastructure.

3. Run the Terraform commands.
```
$ terraform init
$ terraform plan
$ terraform apply
```

4. Run the Terraform command to destroy the infrastructure.
**Note:** Make sure the Postgres RDS instance is deleted before you initiate the destroy.
```
$ terraform destroy
```
