ssh -f -L <local-port>:<rds-address>:<rds-port> <jump_server> -N # run in background
mysql -u<rds-username> -P <local-port> --host='127.0.0.1' -p

psql -h 127.0.0.1 -p <local-port> -U <username> <db_name> # after entered input your password


## lsof 列出建立TCP链接到　xx　port的　相关进程
lsof -n -i4TCP:<portno> | grep <process-id>

## 在第${line}插入数据${text}
sed -i "${line} i ${text}"

## 根据时间查询
find . -not -newerfmt 'Feb 24 09:55'
