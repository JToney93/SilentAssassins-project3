resource "aws_iam_group" "Filipina_wife" {
  name = "Filipina_wife"
}

resource "aws_iam_user" "Angela" {
  name = "Angela"
}

resource "aws_iam_group_membership" "Angela" {
  name = aws_iam_user.Angela.name
  users = [aws_iam_user.Angela.name]
  group = aws_iam_group.Filipina_wife.name
}

#administrator access
data "aws_iam_policy" "administrator_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "Filipina_wife_administrator_access" {
  policy_arn = data.aws_iam_policy.administrator_access.arn
  group      = aws_iam_group.Filipina_wife.name
}
