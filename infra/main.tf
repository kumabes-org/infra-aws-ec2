resource "aws_instance" "webapp" {
    ami = var.imagem
    instance_type = var.tipo_instancia
    security_groups = [ "${aws_security_group.ssh_traffic.name}", "${aws_security_group.web_traffic.name}"]
    user_data = file("./server_script.sh")
    key_name = "id_rsa"
    tags = {
        Name = "webapp"
    }
}

resource "aws_security_group" "ssh_traffic" {
    name = "Permitir acesso via ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["201.43.58.24/32"]
    }
}

resource "aws_security_group" "web_traffic" {
    name = "Permitir acesso via web"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["201.43.58.24/32"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "webapp_public_ip" {
    value = aws_instance.webapp.public_ip
}