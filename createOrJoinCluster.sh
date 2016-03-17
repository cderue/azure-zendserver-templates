# Custom Script for Linux

zendadmin_ui_pass='p2ssw0rd1'
zenddev_ui_pass='p1ssw0rd2'
#zend_order_number='<insert_a_zend_order_number>'
zend_admin_email='cedric.derue@gmail.com'
#zend_license_key='<insert_a_zend_server_license_key>'
zend_self_name=`hostname`
zend_self_addr=`ip a s dev eth0 | grep -oP 'inet\s+\K[^/]+'`
zend_db_host='eu-cdbr-azure-west-d.cloudapp.net'
zend_db_user='b0d4d364be3739'
zend_db_password='fcc50eab'
zend_db_name='zsdb'

## Bootstrap and create	or join	cluster.
sudo /usr/local/zend/bin/zs-manage bootstrap-single-server	-p "$zendadmin_ui_pass" -r TRUE	-a TRUE	-e "$zend_admin_email" -d "$zenddev_ui_pass"
## Restart Zend	Server
#sudo /usr/local/zend/bin/zendctl.sh restart
web_api_key=`sqlite3 /usr/local/zend/var/db/gui.db "select HASH from GUI_WEBAPI_KEYS where NAME='admin';"`
sudo /usr/local/zend/bin/zs-manage restart -N admin -K "$web_api_key"
sudo /usr/local/zend/bin/zs-manage server-add-to-cluster -n "$zend_self_name" -i "$zend_self_addr" -o "$zend_db_host" -u "$zend_db_user" -p "$zend_db_password" -d "$zend_db_name" -K "$web_api_key" -N "admin"
sudo /usr/local/zend/bin/zs-manage restart -N admin -K "$web_api_key"
$ command -v foo > /dev/null 2>&1 || { echo >&2 "I require foo but it's not installed. Aborting."; exit 1; }
$ type foo > /dev/null 2>&1	|| { echo >&2 "I require foo but it's not installed. Aborting."; exit 1; }
$ hash foo 2> /dev/null	|| { echo >&2 "I require foo but it's not installed. Aborting."; exit 1; }
