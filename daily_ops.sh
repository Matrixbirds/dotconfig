ssh -f -L <local-port>:<rds-address>:<rds-port> <jump_server> -N # run in background
mysql -u<rds-username> -P <local-port> --host='127.0.0.1' -p

psql -h 127.0.0.1 -p <local-port> -U <username> <db_name> # after entered input your password


## lsof 列出建立TCP链接到　xx　port的　相关进程
lsof -n -i4TCP:<portno> | grep <process-id>