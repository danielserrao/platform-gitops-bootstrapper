## IAM user

On AWS, create an IAM user with the necessary permissions to create the all infrastructure. 

As best practices, the principle of least privilege should be followed and the user should have the capability to temporarily assume a role that has ONLY the necessary permissions to deploy the resources in this repo.

On the AWS console, someone with enough permissions should create a role (e.g.: `default-role`) which can use the IAM policy at `files/role-iam-policy.json`. 

Then create a trust relationship on that role with the policy at `files/role-trusted-entities.json`. It should include the user(s) as Principals.


# Login using access keys

In this case, enabling the enforcement of MFA on the AWS account is recommended since access keys are store locally which is not ideal for long-term usage.

Then configure the AWS profile with the below command:

```bash
aws configure --profile <IAM-USER>
```

On `~/.aws/config` add:

```bash
[profile default-role]
role_arn = arn:aws:iam::<AWS_ACCOUNT_ID>:role/default-role
source_profile = <IAM-USER>
region = eu-west-3
```

On `~/.aws/credentials`

```bash
[<IAM-USER>]
aws_access_key_id = YOUR_USER_ACCESS_KEY
aws_secret_access_key = YOUR_USER_SECRET_KEY
```

Then run:

```bash
export AWS_PROFILE=default-role
```

The above changes will update the access keys used automatically after running the assume role command below:

```bash
aws sts assume-role \
  --role-arn arn:aws:iam::<AWS_ACCOUNT_ID>:role/<IAM-ROLE> \
  --role-session-name TemporarySession
```

The alternative is to assume the role like below:

```bash
CREDS=$(aws sts assume-role \
  --role-arn arn:aws:iam::<AWS_ACCOUNT_ID>:role/<IAM-ROLE> \
  --role-session-name TemporarySession)

export AWS_ACCESS_KEY_ID=$(echo "$CREDS" | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo "$CREDS" | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo "$CREDS" | jq -r .Credentials.SessionToken)
```