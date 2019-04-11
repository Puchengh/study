3  导入导出数据库
   1)列出mysql数据库中的所有数据库命令
  #  sqoop list-databases --connect jdbc:mysql://localhost:3306/ --username root --password 123456
   
   2)连接mysql并列出数据库中的表命令
   # sqoop list-tables --connect jdbc:mysql://localhost:3306/test --username root --password 123456
   命令中的test为mysql数据库中的test数据库名称  username password分别为mysql数据库的用户密码
   
   3)将关系型数据的表结构复制到hive中
   #sqoop create-hive-table --connect jdbc:mysql://localhost:3306/test --table username --username root --password 123456 --hive-table test
其中 --table username为mysql中的数据库test中的表   --hive-table test 为hive中新建的表名称
   
   4)从关系数据库导入文件到hive中
   #sqoop import --connect jdbc:mysql://localhost:3306/test --username root --password mysql-password --table t1 --hive-import

   5)将hive中的表数据导入到mysql中

   #sqoop export --connect jdbc:mysql://localhost:3306/test --username root --password admin --table uv_info --export-dir /user/hive/warehouse/uv/dt=2011-08-03
