//
//  DataBaseFile.h
//  01-数据持久化作业
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 QingYun. All rights reserved.
//@property (nonatomic, strong) NSString *buycount;
//@property (nonatomic, strong) NSString *icon;
//@property (nonatomic, strong) NSString *price;
//@property (nonatomic, strong) NSString *title;

#ifndef DataBaseFile_h
#define DataBaseFile_h
#define BaseFileName @"tg.db"
//创建表
#define createTabel @"create table if not exists tg(buycount text,icon text,price text,title text);"
//插入数据
#define Inserinto @"insert into tg values(:buycount,:icon,:price,:title)"

//查询本地数据
#define selectAll @"select * from tg"
#define selectChar(a) [NSString stringWithFormat:@"select *from student where name like'%%%@%%'",a]
//删除操作
#define DeleteAll @"delete from student"
#define DeleteStu_Id @"delete from tg where icon=:icon"
//更新数据
#define UpdateSql @"update student set name=:name,age=:age where stu_id=:stu_id"


#endif /* DataBaseFile_h */
