USE mysql;
CREATE USER 'hahlabs'@'%' IDENTIFIED BY 'Hahlabs!123';
GRANT ALL PRIVILEGES ON *.* TO 'hahlabs'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
