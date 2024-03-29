############### IAM ROLE   ################
resource "aws_iam_role" "jenkins-role" {
  name = "jenkins-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = local.common_tags
}


############# IAM POLICY  ##############
resource "aws_iam_role_policy" "jenkins-policy" {
  name = "jenkins-policy"
  role = aws_iam_role.jenkins-role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "ec2:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

############## IAM INSTANCE PROFILE  ##################
resource "aws_iam_instance_profile" "jenkins-profile" {
  name = "jenkins-profile"
  role = aws_iam_role.jenkins-role.name
}