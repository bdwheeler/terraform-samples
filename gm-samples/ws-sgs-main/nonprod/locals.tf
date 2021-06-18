locals {
  ws_dev_web_sg_id = "sg-09ec5bfc363fbf44b"
  ws_dev_app_sg_id = "sg-0e7aa6db99c8bccf2"
  ws_dev_db_sg_id  = "sg-0635fcdf683595302"
  
  ws_tst_web_sg_id = "sg-0eeb73e4214d394e2"
  ws_tst_app_sg_id = "sg-0b437bfe7844c23b8"
  ws_tst_db_sg_id  = "sg-037f0bb05315d4879"
  
  rfs_uat_app_cidrs = ["10.56.22.0/26", "10.56.22.64/26", "10.56.22.128/26"]
}
