//
//  Article.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/29.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface Article : NSObject
{
    sqlite3 *link;
    NSString *path;
}
-(void)insertMessageWithTitle:(NSString *)title andContent:(NSString *)content andId:(NSString *)userId;
- ( NSMutableArray * )showListMethod;
@end