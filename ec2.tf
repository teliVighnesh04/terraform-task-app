resource "aws_instance" "db" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = "demo-key"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.mysql_backend.id]
  associate_public_ip_address = true

  user_data = <<EOF
#!/bin/bash

cd /home/ubuntu/

# update system
sudo apt-get update
wait

# take clone of project
git clone https://github.com/teliVighnesh04/task-app-for-Terraform.git
cd task-app-for-Terraform/MySQL-Setup/

# run installation script
bash installation.sh

EOF

  tags = {
    Name = "MySQL-Server"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = "demo-key"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.flask_app.id]
  associate_public_ip_address = true
  count = 2

  depends_on = [aws_instance.db]

user_data = <<EOF
#!/bin/bash

cd /home/ubuntu/
# update system
sudo apt-get update

# take clone of project
git clone https://github.com/teliVighnesh04/task-app-for-Terraform.git
cd task-app-for-Terraform/

# installation script
bash installation.sh

# Environment variables
export MYSQL_HOST=${aws_instance.db.private_ip}
export MYSQL_USER=user
export MYSQL_PASSWORD=password
export MYSQL_DB=myDb

# Run app
python3 app.py

EOF

  tags = {
    Name = "Web-Server"
  }
}
