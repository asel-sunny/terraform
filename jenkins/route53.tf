data "aws_route53_zone" "hosted_zone" {
  name         = var.domain_name
  private_zone = false
}

# Creating DNS record for the ec2
resource "aws_route53_record" "jenkins_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "jenkins.${aws_acm_certificate.acm.domain_name}"
  type    = "A"
  ttl = 300
  records = [aws_instance.ec2-jenkins.public_ip]
}

resource "aws_route53_record" "www_jenkins_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "www.jenkins.${aws_acm_certificate.acm.domain_name}"
  type    = "A"
  ttl = 300
  records = [aws_instance.ec2-jenkins.public_ip]
}
