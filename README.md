
# Terraform Task App

This project orchestrates infrastructure creation using Terraform, providing a seamless setup for a robust cloud environment. The Terraform configuration encompasses the provisioning of a new VPC, subnets, route tables, internet gateway, NAT gateway, elastic IP, and an Application Load Balancer (ALB). The architecture includes two distinct EC2 instances: a MySQL server tactfully routed in a private subnet, and a frontend application instance. All instances are intelligently connected through the ALB, ensuring an optimized and secure deployment. 


## Prerequisites


```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
```

## Images

![Console Output](https://github.com/teliVighnesh04/terraform-task-app/blob/main/output.png)

![App](https://github.com/teliVighnesh04/terraform-task-app/blob/main/FlaskApp.png)
