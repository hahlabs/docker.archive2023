USE mysql;
CREATE USER 'root'@'%' IDENTIFIED BY 'Root!123';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
CREATE USER 'hahlabs'@'%' IDENTIFIED BY 'Hahlabs!123';
GRANT ALL PRIVILEGES ON *.* TO 'hahlabs'@'%' WITH GRANT OPTION;
UPDATE user SET plugin='auth_socket' WHERE User='hahlabs';
FLUSH PRIVILEGES;

