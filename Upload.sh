#!/bin/sh 
HOST='IP_SERVIDOR_FTP' 
USER='USUARIO_SERVIDOR_FTP' 
PASSWD='SENHA_SERVIDOR_FTP' 
FILE='hw_ctree.xml' 
 
usuario_login=$1 
usuario_senha=$2 
 
sed -i "s/USUARIO_PPPOE_DEFAULT_DO_ARQUIVO/$usuario_login/" $FILE 
sed -i "s/SENHA_PPPOE_DEFAULT_DO_ARQUIVO/$usuario_senha/" $FILE 
 
gzip $FILE 
FILE_GZ=$FILE'.gz' 
 
cp BKP_$FILE $FILE 
 
ftp -n $HOST <<END_SCRIPT 
quote USER $USER 
quote PASS $PASSWD 
binary 
delete $FILE_GZ 
put $FILE_GZ 
quit 
END_SCRIPT 
exit 0
