//
//  LookLookController.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/28.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LookLkViewController.h"

@interface LookLookController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *lookView;
@property(nonatomic,strong)UILabel *labelI;
@property(nonatomic,strong)UIImageView *imageIV;
@property(nonatomic , strong)NSArray *arrI;
@property(nonatomic , strong)NSArray *arrII;
@property(nonatomic ,strong)LookLkViewController *lk;


@end

