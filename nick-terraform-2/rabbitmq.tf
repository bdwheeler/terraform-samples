provider "rabbitmq" {
  version = "~> 1.4"
  endpoint = "https://${var.rmq_broker_endpoint_temp}"
  username = var.rmq_user
  password = var.rmq_password
}

resource "rabbitmq_policy" "ha-all" {
  name = "ha-all"
  vhost = "/"
  # apply_to = "all"
  policy {
    pattern = ".*"
    apply_to = "all"
    priority = 1
    definition = {
      ha-mode = "all"
      ha-sync-mode = "automatic"
    }
  }
}

resource "rabbitmq_policy" "morpheusAgentActions" {
  name = "morpheusAgentActions"
  vhost = "/"

  policy {
    pattern = "morpheusAgentActions.*"
    apply_to = "queues"
    priority = 2
    definition = {
      expires = 1800000
      ha-mode = "all"
    }
  }
}

resource "rabbitmq_policy" "statCommands" {
  name = "statCommands"
  vhost = "/"
  
  policy {
    pattern = "statCommands.*"
    apply_to = "queues"
    priority = 2
    definition = {
      expires = 1800000
      ha-mode = "all"
    }
  }
}

resource "rabbitmq_policy" "monitorJobs" {
  name = "monitorJobs"
  vhost = "/"

  policy {
    pattern = "monitorJobs.*"
    apply_to = "queues"
    priority = 2
    definition = {
      expires = 1800000
      ha-mode = "all"
    }
  }
}
