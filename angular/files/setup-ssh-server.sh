# run as root
mkdir /var/run/sshd
echo 'root:HAH7A85@#!' | chpasswd
sed -Ei 's/#(PermitRootLogin).+/\1 yes/' /etc/ssh/sshd_config
sed -Ei 's/#Port 22/Port 8122/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
echo "export VISIBLE=now" >> /etc/profile