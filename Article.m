//
//  Article.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/29.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "Article.h"

@implementation Article
-(id)init{
    self=[super init];
    //定义数据库设置
    path=@"/Users/dc004/Desktop/Forum.db";
    //打开数据库链接
    sqlite3_open([path UTF8String], &link);
    //创建用户表的SQL语句
    NSString *createArticalTable=@"create table if not exists Artical(id integer primary key autoincrement,userId integer,title varchar(20),content varchar(1000),dateTime time)";
    //    //创建用户表的SQL语句自动插入时间
    //    NSString *createArticalTable=@"create table if not exists Artical(id integer primary key autoincrement,userId integer,title varchar(20),content varchar(1000),dateTime defalut(datetime('now','localtime')))";
    //执行SQL语句
    sqlite3_exec(link, [createArticalTable UTF8String],nil,nil,nil);
    
    return self;
}
//插入方法
-(void)insertMessageWithTitle:(NSString *)title andContent:(NSString *)content andId:(NSString *)userId{
    NSString * insertMessage=[NSString stringWithFormat:@"insert into Artical(userId,title,content,dateTime) values(\"%@\",\"%@\",\"%@\",datetime(\"now\",\"localTime\"));",userId,title,content];
    
    sqlite3_exec(link, [insertMessage UTF8String] , nil,nil,nil);
}

- ( NSMutableArray * )showListMethod{
    
    sqlite3_stmt *stmt;
    
    NSMutableArray *mutableArray=[[NSMutableArray alloc]initWithCapacity:10];
    
    NSDictionary *dict;
    
    NSString *select=@"select * from Artical";
    
    sqlite3_exec(link, [select UTF8String], nil, nil, nil);
    
    sqlite3_prepare_v2(link, [select UTF8String], -1, &stmt, nil);
    
    while (sqlite3_step(stmt)==SQLITE_ROW) {
        NSString * articalId=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 0) encoding:NSUTF8StringEncoding];
        NSString * userId=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 1) encoding:NSUTF8StringEncoding];
        NSString *title=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 2) encoding:NSUTF8StringEncoding];
        NSString *content=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 3) encoding:NSUTF8StringEncoding];
        NSString *time=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 4) encoding:NSUTF8StringEncoding];
        dict=@{
               @"articalId":articalId,
               @"userId":userId,
               @"title":title,
               @"content":content,
               @"time":time
               };
        [mutableArray addObject:dict];
    }
    return mutableArray;
}



////
//-(NSMutableArray *)showMethodWith:(NSInteger)userId{
//    sqlite3_stmt *stmt;
//
//    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:10];
//    NSString * selectAccount=[NSString stringWithFormat:@"select * from Artical where id=%li;",userId];
//    sqlite3_prepare_v2(link, [selectAccount UTF8String], -1, &stmt, nil);
//    while (sqlite3_step(stmt)==SQLITE_ROW) {
//        NSString *passwordFromDataBase=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 2) encoding:NSUTF8StringEncoding];
//    }
//
//    return array;
//}



@end

