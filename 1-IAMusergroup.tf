resource "aws_iam_group" "Brazilian_wife" {
  name = "Brazilian_wife"
}

resource "aws_iam_user" "Paola" {
  name = "Paola"
}

resource "aws_iam_group_membership" "Paola" {
  name = aws_iam_user.Paola.name
  users = [aws_iam_user.Paola.name]
  group = aws_iam_group.Brazilian_wife.name
}

#rds full
data "aws_iam_policy" "rds_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

#ec2 custome

data "aws_iam_policy_document" "ec2_instance_actions" {
  statement {
    actions = [
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:TerminateInstances",
    ]

    resources = [
      "arn:aws:ec2:*:*:instance/*",
    ]
  }
}

resource "aws_iam_policy" "ec2_instance_actions" {
  name        = "ec2_instance_actions"
  policy      = data.aws_iam_policy_document.ec2_instance_actions.json
}

resource "aws_iam_group_policy_attachment" "Brazilian_wife_rds_full_access" {
  policy_arn = data.aws_iam_policy.rds_full_access.arn
  group      = aws_iam_group.Brazilian_wife.name
}

resource "aws_iam_group_policy_attachment" "Brazilian_wife_ec2_instance_actions" {
  policy_arn = aws_iam_policy.ec2_instance_actions.arn
  group      = aws_iam_group.Brazilian_wife.name
}
