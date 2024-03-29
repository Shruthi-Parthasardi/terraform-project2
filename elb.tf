 resource "aws_elb" "bar" {
  name                      = "shruthi-terraform-elb"
  availability_zones        = ["ap-southeast-1a","ap-southeast-1b"]

  listener {
    instance_port          = 80
    instance_protocol      = "http"
    lb_port                = 80
    lb_protocol            = "http"
  }
 
  health_check {
    healthy_threshold    = 2
    unhealthy_threshold  = 2
    timeout              = 5
    target               = "HTTP:80/"
    interval             = 30
  }

  instances                 = ["${aws_instance.one.id}","${aws_instance.two.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {   
    Name = "shruthi-tf-elb"
  }
}

