#!/bin/bash

sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 100px;
        }

        h1 {
            color: #333;
            font-size: 2em;
        }

        p {
            color: #666;
            font-size: 1.2em;
        }
    </style>
    <title>Welcome Page</title>
</head>
<body>
    <h1>Welcome!</h1>
    <p>Deployed via Terraform</p>
</body>
</html>'  |  sudo tee /usr/share/nginx/html/index.html