module "mod_rds" {
    source      = "./modules/RDS/"

    #inputs:
    access_key              = var.access_key
    secret_key              = var.secret_key
    instance_class          = var.instance_class
    client                  = var.client
    environment             = var.environment
    region                  = var.region
    multi_az                = var.multi_az
    vpc_subnet_az1          = var.vpc_subnet_az1
    vpc_subnet_az2          = var.vpc_subnet_az2
    family                  = var.family
    engine_name             = var.engine_name
    major_engine_version    = var.major_engine_version
    options                 = var.options
    db_name                 = upper(var.db_name)
    db_port                 = var.db_port
    allocated_storage       = var.allocated_storage
    max_allocated_storage   = var.max_allocated_storage
    storage_type            = var.storage_type
    iops                    = var.iops
    character_set_name      = var.character_set_name
    workspaces_cidr         = var.workspaces_cidr
    engine_version          = var.engine_version
    backup_retention_period = var.backup_retention_period
    open_cursors            = var.open_cursors
    db_files                = var.db_files
    maintenance_window      = var.maintenance_window
    backup_window           = var.backup_window
    undo_retention          = var.undo_retention
    session_cached_cursors  = var.session_cached_cursors
    enable_s3_integration   = var.enable_s3_integration
    query_rewrite_integrity = var.query_rewrite_integrity
    apply_immediately       = var.apply_immediately
}

module "mod_secretsmanager" {
    source = "./modules/SecretsManager/"

    #inputs:
    soc_access_key          = var.soc_access_key
    soc_secret_key          = var.soc_secret_key
    secret_name             = format("%s/%s/RDS/%s", var.client, var.account_name, var.db_name)  #Will result in GinnieMae/DMC3Test/RDS/<dbname> 
    secret_value_dbname     = lower(var.db_name)
    secret_value_dbendpoint = module.mod_rds.new_db_instance_endpoint
    secret_value_dbarn      = module.mod_rds.new_db_instance_arn
    secret_value_dbusername = module.mod_rds.new_db_instance_username
    secret_value_dbpassword = module.mod_rds.new_db_instance_password
    db_port                 = var.db_port
    account_name            = var.account_name
    engine_name             = var.engine_name
    secret_cmk_id           = var.secret_cmk_id
    cicd_role_arn           = var.cicd_role_arn
}
