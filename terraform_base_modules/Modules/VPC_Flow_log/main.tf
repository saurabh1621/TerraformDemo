resource "aws_cloudwatch_log_group" "cloudwatch" {
  name = "sample_cloudwatch"
}

resource "aws_flow_log" "flowlog" {
  iam_role_arn    = aws_iam_role.iam_flowlog.arn
  log_destination = aws_cloudwatch_log_group.cloudwatch.arn
  traffic_type    = "ALL"
  vpc_id          = var.vpc_id
}

resource "aws_iam_role" "iam_flowlog" {
  name = "flowlog"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "flowlog_policy" {
  name = "flowlog"
  role = aws_iam_role.iam_flowlog.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}