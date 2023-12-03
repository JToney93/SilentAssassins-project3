resource "aws_iam_group" "Colombian_wife" {
  name = "Colombian_wife"
}

resource "aws_iam_user" "Yessica" {
  name = "Yessica"
}

resource "aws_iam_group_membership" "Yessica" {
  name = aws_iam_user.Yessica.name
  users = [aws_iam_user.Yessica.name]
  group = aws_iam_group.Colombian_wife.name
}

#aws health full access
data "aws_iam_policy" "aws_health_full_access" {
  arn = "arn:aws:iam::aws:policy/AWSHealthFullAccess"
}

resource "aws_iam_group_policy_attachment" "Colombian_wife_aws_health_full_access" {
  policy_arn = data.aws_iam_policy.aws_health_full_access.arn
  group      = aws_iam_group.Colombian_wife.name
}
