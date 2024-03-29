# AWS SecretsManager Terraform module

Terraform module which creates a new Secret in the SOC's Secret Manager, taking as input:
* The name for the secret
* A list of values to store
* The CMK id to encrypt the secret

The following resources are created:
* [Secret](https://www.terraform.io/docs/providers/aws/r/secretsmanager_secret.html)
* [Secret Version](https://www.terraform.io/docs/providers/aws/r/secretsmanager_secret_version.html)

## Provider.tf

The provider.tf file must be given keys to the SOC account, which will most likely be different than the account where the Database will be created.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| secret\_name | Name of the client | `string` | `""` | no |
| secret\_arn | The ARN of an existing secret, if the values should be updated. Leave blank if a new Secret needs to be created | `string` | `""` | no |
| secret\_value\_dbendpoint | String to connect to the DB. Leave blank as the code itself will fill this info | `string` | `""` | no |
| secret\_value\_dbarn | ARN of the DB. Leave blank as the code itself will fill this info | `string` | `""` | no |
| secret\_value\_dbpassword | Password for the master user. Leave blank as the code itself will fill this info | `string` | `""` | no |
| port | Connection port | `string` | `""` | no |
| engine\_name | Engine name (i.e. oracle-ee) | `string` | `""` | no |
| client\_name | Name of the client (client-1) | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| new\_secret\_arn | The ARN for the new Secret in SOC |


### Terraform Command Manual Deployment
```terraform
terraform apply -var secret_name="<NEW_SECRET_NAME>" -var='secret_values={"DBEndpoint":"<ENDPOINT>","DBARN":"<ARN>", "Username":"<USERNAME>", "Password":"<PASSWORD>"}'
```

Example:
```terraform
terraform apply -var secret_name="GinnieMae/DMC3Test/RDS/cinco" -var='secret_values={"DBEndpoint":"cinco.crrkqfc6amb8.us-gov-east-1.rds.amazonaws.com","DBARN":"arn:aws-us-gov:rds:us-gov-east-1:861511318332:db:cinco", "Username":"usrcinco", "Password":"abc1234!"}'
```
