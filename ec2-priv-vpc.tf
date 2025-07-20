
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    created_by = "terraform"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    created_by = "terraform"
  }
}

resource "aws_network_interface" "mynic" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["10.1.0.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "myvm" {
  ami           = "ami-0a1235697f4afa8a4" #
  instance_type = "t3.micro"

  network_interface {
    network_interface_id = aws_network_interface.mynic.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
