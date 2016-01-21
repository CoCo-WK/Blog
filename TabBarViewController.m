//
//  TabBarViewController.m
//  博客11-27
//
//  Created by dc004 on 16/1/21.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()
{
 NSNumber *tag;
}
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewCon = [[ViewController alloc]init];
    _listViewCon = [[ListViewController alloc]init];
    
    _viewCon.tabBarItem.title = @"首页";
    _viewCon.tabBarItem.image = [UIImage imageNamed:@"5"];
    _listViewCon.tabBarItem.title = @"列表";
    _listViewCon.tabBarItem.image = [UIImage imageNamed:@"4"];
    self.viewControllers = @[_viewCon,_listViewCon];
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    tag = [userDe valueForKey:@"user"];
    NSArray *arr = @[@1,@2];
    if(tag == arr[0]){
        self.selectedViewController = _viewCon;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
