//
//  TabBarViewController.h
//  博客11-27
//
//  Created by dc004 on 16/1/21.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ListViewController.h"
@interface TabBarViewController : UITabBarController
@property(nonatomic,strong)ViewController *viewCon;
@property(nonatomic,strong)ListViewController *listViewCon;
@end
