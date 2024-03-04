data "aws_route53_zone" "hosted_zone" {
  name         = var.domain_name
  private_zone = false
}

# Creating DNS record for the load balancer
resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = aws_acm_certificate.acm.domain_name
  type    = "A"

  alias {
    name                   = aws_lb.my_app_launch.dns_name
    zone_id                = aws_lb.my_app_launch.zone_id
    evaluate_target_health = false
  }
}



# resource "aws_route53_record" "site_domain" {
#   zone_id = data.aws_route53_zone.hosted_zone.zone_id
#   name = var.record_name
#   type = "A"

#   alias {
#     name = aws_lb.my_app_launch.dns_name
#     zone_id = aws_lb.my_app_launch.zone_id
#     evaluate_target_health = true
#   }
# }