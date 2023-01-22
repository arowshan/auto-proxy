# Auto Proxy
#### This project automates creation of an Outline VPN & WhatsApp Proxy server on a single AWS instance using Terraform.

## One Time Setup

1. Create an [AWS account](https://aws.amazon.com/)
2. Create and download [access key](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/) for your IAM user 
3. Set your access key and secret access key

##### on Mac
```bash
export AWS_ACCESS_KEY_ID=<your-access-key>
export AWS_SECRET_ACCESS_KEY=<your-secret-key>
```

##### on Windows
```bash
set AWS_ACCESS_KEY_ID=<your-access-key>
set AWS_SECRET_ACCESS_KEY=<your-secret-key>
```

4. Install [Terraform](https://developer.hashicorp.com/terraform/downloads)
5. Clone this Repo
6. Generate an [SSH key pair](https://docs.oracle.com/en/cloud/cloud-at-customer/occ-get-started/generate-ssh-key-pair.html)
7. Copy your public key value into <em>public_key</em> in [main.tf](main.tf)

## Create VPN & Proxy

In the auto-proxy directory that you cloned run:
```commandline
terraform init
terraform apply
```
(type yes)

## WhatsApp Proxy
Get instance public ip
```commandline
terraform output
```
Share this ip with you contact <b>privately</b>.

## Outline VPN
In the directory where you have your private key, run:
```bash
ssh -i <your-private-key> ec2-user@<instance-public-ip> grep { /outline.log
```
Download [outline manager](https://getoutline.org/get-started/#step-1) and follow the steps for AWS.

Paste the output value from the command above in outline manager and share the outline ssh key with your contact.


## Delete All
In order to delete the servers that you create with terraform, don't make changes on the aws console manually. Use this command: 
```commandline
terraform destroy
```