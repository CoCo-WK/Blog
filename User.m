//
//  User.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/29.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "User.h"

@implementation User

-(id)init{
    self=[super init];
    //定义数据库设置
    path=@"/Users/dc004/Desktop/Forum.db";
    //打开数据库链接
    sqlite3_open([path UTF8String], &link);
    //创建用户表的SQL语句
    NSString *createUserTable=@"create table if not exists User(userId integer primary key autoincrement,account varchar(20),password varchar(20),nickName varchar(20))";
    //执行SQL语句
    sqlite3_exec(link, [createUserTable UTF8String],nil,nil,nil);
    
    return self;
}
//插入方法
-(void)insertMessageWithAccount:(NSString *)account andPassword:(NSString *)password andNickName:(NSString *)nickName{
    NSString *insertMessage=[NSString stringWithFormat:@"insert into User(account,password,nickName) values(\"%@\",\"%@\",\"%@\");",account,password,nickName];
    
    sqlite3_exec(link, [insertMessage UTF8String] , nil,nil,nil);
}
/*
 sqlite 操作二进制数据需要用一个辅助的数据类型：sqlite3_stmt * 。
 
 这个数据类型 记录了一个“sql语句”。为什么我把 “sql语句” 用双引号引起来？因为你可以把 sqlite3_stmt * 所表示的内容看成是 sql语句，但是实际上它不是我们所熟知的sql语句。它是一个已经把sql语句解析了的、用sqlite自己标记记录的内部数据结构。
 sqlite3_stmt * stat;是把一个 sql 语句解析到 stat 结构里去：
 */


//注册时检查账号存在性
-(BOOL)jugdeExist:(NSString *)account{
    sqlite3_stmt *stam;
    //    NSString *accountFromDataBase;
    NSString *judge=[NSString stringWithFormat:@"select account from User where account=\"%@\";",account];
    sqlite3_exec(link, [judge UTF8String],nil,nil,nil);
    
    //进行预编译
    sqlite3_prepare_v2(link, [judge UTF8String], -1, &stam, nil);
    //每条数据查找
    while (sqlite3_step(stam)==SQLITE_ROW) {
        return YES;
    }
    return NO;
}
//登录操作
-(NSMutableArray *)loginMethod:(NSString *)account andPassword:(NSString *)password{
    NSLog(@"%@, %@", account, password);
    sqlite3_stmt *stmt;
    NSString *userId=@"";
    NSString *userName=@"";
    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:10];
    NSString * selectAccount=[NSString stringWithFormat:@"select * from User where account=\"%@\";",account];
    if(sqlite3_prepare_v2(link, [selectAccount UTF8String], -1, &stmt, nil)==SQLITE_OK){
             while (sqlite3_step(stmt)==SQLITE_ROW) {
                NSString *passwordFromDataBase=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 2) encoding:NSUTF8StringEncoding];
                if ([passwordFromDataBase isEqualToString:password]) {
                    userId=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 0) encoding:NSUTF8StringEncoding];
                    userName=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 3) encoding:NSUTF8StringEncoding];
                    [array addObject:userId];
                    [array addObject:userName];
                    
                    NSLog(@"-----%@",array);
            
        }
    }
    }
    else {
        NSLog(@"farie");
    }
    
    return array;
}


-(NSString *)findName:(NSString *)userId{
    sqlite3_stmt *stmt;
    NSString *userName;
    NSString * selectName=[NSString stringWithFormat:@"select nickName from User where userId=%li;",[userId integerValue]];
    sqlite3_prepare_v2(link, [selectName UTF8String], -1, &stmt, nil);
    while (sqlite3_step(stmt)==SQLITE_ROW) {
        
        userName=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 0) encoding:NSUTF8StringEncoding];
    }
    
    return userName;
}

@end