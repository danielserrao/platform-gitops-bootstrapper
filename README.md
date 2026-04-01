# platform-gitops-bootstrapper (Work in progress)

This repo allows to deploy a management cluster which will include Flux.

After initial bootstrap with Terraform, Flux should automatically sync state from the repo at platform-gitops and start managing it self.

Terraform should not manage the same Flux configuration as Flux itself.

# Steps to deploy the Management Cluster

This example uses the development environment, but you could use another.

If you still are not logged in or have a user for this purpose, you can check how I log into my AWS account using good practices at [aws-login.md](./files/aws-login.md). Alternatively you can follow https://docs.aws.amazon.com/signin/latest/userguide/command-line-sign-in.html to log in a different way.

Make sure to be using the right AWS account and Role/User with the command:

```bash
aws sts get-caller-identity
```

Initialize Terraform project:

```bash
cd infrastructure/environments/development
```
```bash
terraform init
```

Always run the below command and check what is changed. Pay extra attention for updates and deletes.

```bash
terraform plan
```

Deploy with the below command:

```bash
terraform apply
```

## Test accessing EKS cluster

```bash
aws eks update-kubeconfig --region eu-west-3 --name management-development-eks
```

```bash
kubectl get nodes
```

# More documentation 

- [Platform GitOps Bootstrapper Architecture](./files/platform-gitops-bootstrapper-architecture.drawio.png)
