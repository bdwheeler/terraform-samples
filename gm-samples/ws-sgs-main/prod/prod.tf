###### PROD ############################
resource "aws_security_group_rule" "ws_prod_app_sg__tcp445to445__allow__RGNMESPORA001_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.19.136.13/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA001 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp22to22__allow__RGNMESPORA001_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.19.136.13/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA001 TCP:22"
}

resource "aws_security_group_rule" "ws_prod_db_sg__tcp445to445__allow__RGNMESPORA001_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.19.136.13/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA001 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_db_sg__tcp22to22__allow__RGNMESPORA001_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.19.136.13/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA001 TCP:22"
}
resource "aws_security_group_rule" "ws_prod_db_sg__tcp445to445__allow__RGNMXWVSQL002A_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.208.87.101/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSQL002A TCP:445"
}
resource "aws_security_group_rule" "ws_prod_db_sg__tcp22to22__allow__RGNMXWVSQL002A_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.208.87.101/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSQL002A TCP:22"
}

resource "aws_security_group_rule" "ws_prod_db_sg__tcp445to445__allow__RGNMXWVSQL002B_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.208.87.108/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSQL002B TCP:445"
}
resource "aws_security_group_rule" "ws_prod_db_sg__tcp22to22__allow__RGNMXWVSQL002B_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.208.87.108/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSQL002B TCP:22"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp445to445__allow__11VSAPXP01DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.12/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP01DD TCP:445"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp22to22__allow__11VSAPXP01DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.12/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP01DD TCP:22"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp445to445__allow__11VSAPXP02DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.14/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP02DD TCP:445"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp22to22__allow__11VSAPXP02DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.14/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP02DD TCP:22"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp445to445__allow__11VSAPXP03DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.8/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP03DD TCP:445"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp22to22__allow__11VSAPXP03DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.8/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP03DD TCP:22"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp445to445__allow__11VSAPXP04DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.9/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP04DD TCP:445"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp22to22__allow__11VSAPXP04DD_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.84.9/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM 11VSAPXP04DD TCP:22"
}

resource "aws_security_group_rule" "ws_prod_web_sg__tcp445to445__allow__RGNMXWVSPA001_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.38.5.163/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSPA001 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp22to22__allow__RGNMXWVSPA001_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.38.5.163/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSPA001 TCP:22"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp445to445__allow__RGNMXWVSPA201_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.38.5.162/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSPA201 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp22to22__allow__RGNMXWVSPA201_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.38.5.162/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSPA201 TCP:22"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp445to445__allow__RGNMXWVSPA301_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.87.132/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSPA301 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp22to22__allow__RGNMXWVSPA301_sg" {
  security_group_id         = local.ws_prod_web_sg_id  
  cidr_blocks               = ["10.208.87.132/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMXWVSPA301 TCP:22"
}

resource "aws_security_group_rule" "ws_prod_app_sg__tcp445to445__allow__RGNMESPORA301_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.19.135.11/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA301 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp22to22__allow__RGNMESPORA301_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.19.135.11/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA301 TCP:22"
}
resource "aws_security_group_rule" "ws_prod_db_sg__tcp445to445__allow__RGNMESPORA301_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.19.135.11/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA301 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_db_sg__tcp22to22__allow__RGNMESPORA301_sg" {
  security_group_id         = local.ws_prod_db_sg_id  
  cidr_blocks               = ["10.19.135.11/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM RGNMESPORA301 TCP:22"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp445to445__allow__ANPRDCC01_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.208.83.229/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM ANPRDCC01 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp22to22__allow__ANPRDCC01_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.208.83.229/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM ANPRDCC01 TCP:22"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp445to445__allow__ANPRDCC02_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.208.83.230/32"]
  type                      = "ingress"
  from_port                 = "445"
  to_port                   = "445"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM ANPRDCC02 TCP:445"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp22to22__allow__ANPRDCC02_sg" {
  security_group_id         = local.ws_prod_app_sg_id  
  cidr_blocks               = ["10.208.83.230/32"]
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-547] Ingress from IBM ANPRDCC02 TCP:22"
}

resource "aws_security_group_rule" "ws_prod_app_sg__tcp443to443_allow_workspaces_cidr" {
  security_group_id = local.ws_prod_app_sg_id
  cidr_blocks       = [var.workspaces_cidr]
  type              = "ingress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "TCP"
  description       = "[CAR-520] CipherCloud from workspaces"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp8443to8443_allow_workspaces_cidr" {
  security_group_id = local.ws_prod_app_sg_id
  cidr_blocks       = [var.workspaces_cidr]
  type              = "ingress"
  from_port         = "8443"
  to_port           = "8443"
  protocol          = "TCP"
  description       = "[CAR-520] CipherCloud from workspaces"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp8080to8080__allow_workspaces_cidr" {
  security_group_id = local.ws_prod_app_sg_id
  cidr_blocks       = [var.workspaces_cidr]
  type              = "ingress"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "TCP"
  description       = "[CAR-520] CipherCloud"
}
resource "aws_security_group_rule" "ws_prod_web_sg__tcp80to82_allow_workspaces_cidr" {
  security_group_id = local.ws_prod_web_sg_id
  cidr_blocks       = [var.workspaces_cidr]
  type              = "ingress"
  from_port         = "80"
  to_port           = "82"
  protocol          = "TCP"
  description       = "[CAR-520] SharePoint web / Bulk DD from workspaces"
}
resource "aws_security_group_rule" "ws_prod_app_sg__tcp80to82_allow_workspaces_cidr" {
  security_group_id = local.ws_prod_app_sg_id
  cidr_blocks       = [var.workspaces_cidr]
  type              = "ingress"
  from_port         = "80"
  to_port           = "82"
  protocol          = "TCP"
  description       = "[CAR-520] SharePoint app from workspaces"
}
resource "aws_security_group_rule" "ws_prod_db_sg__tcp1433to1434_allow_workspaces_cidr" {
  security_group_id = local.ws_prod_db_sg_id
  cidr_blocks       = [var.workspaces_cidr]
  type              = "ingress"
  from_port         = "1433"
  to_port           = "1434"
  protocol          = "TCP"
  description       = "[CAR-676] Ingress from workspace to WS DB security group on 1433-1434"
}


resource "aws_security_group_rule" "ws_prod_db_sg__tcp22to22__allow__ws_prod_app_sg" {
  security_group_id         = local.ws_prod_db_sg_id
  cidr_blocks               = local.rfs_prod_app_cidrs
  type                      = "ingress"
  from_port                 = "22"
  to_port                   = "22"
  protocol                  = "TCP"
  description               = "[CAR-593] SAS (Disclosure) & SAS (Risk Analysis). Ingress from RFS-PROD-APP through TCP:22"
}

resource "aws_security_group_rule" "ws_prod_db_sg__tcpmultipleports__allow__ws_prod_app_sg" {
  for_each                  = toset(["1433", "1434","4022", "135"])
  security_group_id         = local.ws_prod_db_sg_id
  cidr_blocks               = local.rfs_prod_app_cidrs
  type                      = "ingress"
  from_port                 = each.value
  to_port                   = each.value
  protocol                  = "TCP"
  description               = format("[CAR-593] Tableau. Ingress from RFS-PROD-APP through TCP:%s", each.value)
}

resource "aws_security_group_rule" "ws_prod_db_sg__tcp1521to1530__allow__ws_prod_app_sg" {
  security_group_id         = local.ws_prod_db_sg_id
  source_security_group_id  = local.ws_prod_app_sg_id
  type                      = "ingress"
  from_port                 = "1521"
  to_port                   = "1530"
  protocol                  = "TCP"
  description               = "[CAR-593] Ciphercloud Servers / Sharepoint DEV / Bulk DD. Ingress from WS-PROD-APP through TCP:1521-1530"
}

resource "aws_security_group_rule" "ws_prod_db_sg__tcp1433to1434__allow__ws_prod_app_sg" {
  security_group_id         = local.ws_prod_db_sg_id
  source_security_group_id  = local.ws_prod_app_sg_id
  type                      = "ingress"
  from_port                 = "1433"
  to_port                   = "1434"
  protocol                  = "TCP"
  description               = "[CAR-593] Sharepoint DEV / Bulk DD. Ingress from WS-PROD-APP through TCP:1433-1434"
}

resource "aws_security_group_rule" "ws_prod_db_sg__tcp1433to1434__allow__ws_prod_web_sg" {
  security_group_id         = local.ws_prod_db_sg_id
  source_security_group_id  = local.ws_prod_web_sg_id
  type                      = "ingress"
  from_port                 = "1433"
  to_port                   = "1434"
  protocol                  = "TCP"
  description               = "[CAR-593] Sharepoint DEV / Bulk DD. Ingress from WS-PROD-WEB through TCP:1433-1434"
}

resource "aws_security_group_rule" "ws_prod_app_sg__tcpmultipleports__allow__ws_prod_web_sg" {
  for_each                  = toset(["808", "32843", "32844", "30000"])
  security_group_id         = local.ws_prod_app_sg_id
  source_security_group_id  = local.ws_prod_web_sg_id
  type                      = "ingress"
  from_port                 = each.value
  to_port                   = each.value
  protocol                  = "TCP"
  description               = format("[CAR-593] Ingress from WS-PROD-WEB through TCP:%s", each.value)
}

resource "aws_security_group_rule" "ws_prod_web_sg__tcpmultipleports__allow__ws_prod_app_sg" {
  for_each                  = toset(["808", "32843", "32844", "30000"])
  security_group_id         = local.ws_prod_web_sg_id
  source_security_group_id  = local.ws_prod_app_sg_id
  type                      = "ingress"
  from_port                 = each.value
  to_port                   = each.value
  protocol                  = "TCP"
  description               = format("[CAR-593] Ingress from WS-PROD-APP through TCP:%s", each.value)
}

resource "aws_security_group_rule" "ws_prod_db_sg__tcp1521to1530__allow__ws_prod_web_sg" {
  security_group_id         = local.gmep_prod_db_sg_id
  source_security_group_id  = local.gmep_prod_web_sg_id
  type                      = "ingress"
  from_port                 = "1521"
  to_port                   = "1530"
  protocol                  = "TCP"
  description               = "[CAR-593] Ingress from web-sg TCP:1521-1530"
}