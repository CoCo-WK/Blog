//
//  User.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/29.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface User : NSObject
{
    sqlite3 *link;
    NSString *path;
}
//插入数据
-(void)insertMessageWithAccount:(NSString *)account andPassword:(NSString *)password andNickName:(NSString *)nickName;
//注册时检查账号存在性
-(BOOL)jugdeExist:(NSString *)account;

//登录操作
-(NSMutableArray *)loginMethod:(NSString *)account andPassword:(NSString *)password;

-(NSString *)findName:(NSString *)userId;
@end