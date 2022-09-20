data "aws_iam_policy_document" "iam_ec2_assume_role" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "ui_node_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.iam_ec2_assume_role.json
}

resource "aws_iam_instance_profile" "ui_node_instance_profile" {
  name = "ui_node_instance_profile"
  role = aws_iam_role.ui_node_iam_role.name
}

data "aws_iam_policy_document" "iam_rabbit_cluster_query_access" {
  statement {
    effect = "Allow"
    actions = [
      "autoscaling:DescribeAutoScalingInstances",
      "ec2:DescribeInstances"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "iam_rabbit_cluster_access_policy" {
  policy = data.aws_iam_policy_document.iam_rabbit_cluster_query_access.json
}

resource "aws_iam_user" "rabbitmq_peer_discovery_user" {
 name = "rabbitmq_peer_discovery_user"
}

resource "aws_iam_access_key" "rabbitmq_peer_discovery_accesskey" {
  user = aws_iam_user.rabbitmq_peer_discovery_user.name
}

resource "aws_iam_user_policy_attachment" "rabbitmq_peer_discovery_policy_attachment" {
  policy_arn = aws_iam_policy.iam_rabbit_cluster_access_policy.arn
  user = aws_iam_user.rabbitmq_peer_discovery_user.name
}

data "aws_iam_policy_document" "es_ip_access_policy" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    actions = ["es:*"]
    resources = ["*"]
    condition {
      test = "IpAddress"
      values = module.morpheus_ui_nodes.public_ip
      variable = "aws:SourceIp"
    }
  }
}
