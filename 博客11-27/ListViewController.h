//
//  ListViewController.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "LookViewController.h"

@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *listTable;
@property(nonatomic,strong)UILabel *labelI;
@property(nonatomic,strong)ViewController *viewCon;
@property(nonatomic,strong)LookViewController *lookView;
@property(nonatomic,strong)UIImageView *imageI;
@property(nonatomic,strong)NSMutableArray *arrayContent;
@end
