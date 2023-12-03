resource "aws_iam_group" "Kenyan_wife" {
  name = "Kenyan_wife"
}

resource "aws_iam_user" "Agnes" {
  name = "Agnes"
}

resource "aws_iam_group_membership" "Agnes" {
  name = aws_iam_user.Agnes.name
  users = [aws_iam_user.Agnes.name]
  group = aws_iam_group.Kenyan_wife.name
}

#route53 full access
data "aws_iam_policy" "amazon_route_53_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

resource "aws_iam_group_policy_attachment" "Kenyan_wife_amazon_route_53_full_access" {
  policy_arn = data.aws_iam_policy.amazon_route_53_full_access.arn
  group      = aws_iam_group.Kenyan_wife.name
}
