#!/bin/bash
unset user u_i_group a
a="`grep ^sinhvien /etc/group`" #trich xuat group sinhvien
u_i_group="${a##*:}" #lay danh sach user trong sinhvien
for user in `cat /etc/passwd | awk -F ":" '{print $1}'`
do
	if echo $u_i_group | grep $user 1>/dev/null 
	then
		sudo gpasswd -d $user sinhvien 1>/dev/null #xoa user khoi group sinhvien
	else
		sudo sudo usermod -a -G sinhvien $user #add user vao group
	fi
done


