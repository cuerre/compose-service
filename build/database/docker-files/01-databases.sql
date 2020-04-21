# Create databases
CREATE DATABASE IF NOT EXISTS `service_test`;

# Create user for the services
CREATE USER 'normal_user'@'%' IDENTIFIED BY 'normal_password';
GRANT ALL PRIVILEGES ON `service_%`.* TO 'normal_user'@'%';

