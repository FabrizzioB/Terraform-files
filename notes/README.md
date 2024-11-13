# AWS Configuration

### Install and Configure AWS on Linux Mint


- sudo apt-get install awscli

- aws configure

- Create a User (if not exists) in IAM (IAM > USERS > CREATE USER > SET PERMISSIONS (AmazonEC2ContainerRegistryFullAccess))
AWS Access Key ID [None]: YOUR_ACCESS_KEY -> SELECT THE USER CREATED > ACCESS KEYS (CREATE ACCESS KEY, THIS WILL ALSO GIVE YOU SECRET KEY)
AWS Secret Access Key [None]: YOUR_SECRET_KEY -> GIVEN IN ACCESS KEYS
Default region name [None]: YOUR_REGION -> Select the region.
Default output format [None]: EMPTY


### Verify the configuration through the AWS files (Linux)

cat ~/.aws/credentials
cat ~/.aws/config


### Infrastructure example of Terraform folder

Structure resume

- main.tf: Defines the resources of the infrastructure.
- variables.tf: Declares the variables which are used to parameterize the configuration.
- outputs.tf: Defines the outputs that are shown after the Terraform execution.
