# Terraform Morpheus

## Usage

This assumes the following:

- VPC to be built
- AWS MQ RabbitMQ is already built
  - Will be automated once terraform catches up
- Existing Route53 domain
- Existing SSL certificate for Morpheus FQDN

Variables:

- Defaults are in variables.tf
- Copy vars.auto.tfvars.dist to zz.auto.tfvars and modify examples as needed
- Required: 
    - route53_domain_name
        - This will pull in route53 config for this domain
    - morpheus_fqdn
        - FQDN for the ALB.  Will be created as CNAME to the ALB.
    - ssl_certificate_arn
        - Existing certificate for the FQDN.  I created a wildcard for this.
    - ssh_allowed_ips
        - IPs allowed to SSH into the instances.  I used my home IP.
    - pubkey_path
        - SSH publickey to add to the instances
    - db_name
        - Database name
    - db_username
        - Database username
    - db_password
        - Database password (Must meet AWS complexity requirements)
    - rmq_user
        - RabbitMQ username
    - rmq_password
        - RabbitMQ password (Must meet AWS complexity requirements)
    - rmq_broker_endpoint_temp
        - This is the hostname of the AWS MQ RabbitMQ Broker.  Needs to be created and running before running TF.
