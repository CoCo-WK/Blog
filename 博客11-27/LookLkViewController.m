//
//  LookLkViewController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/12/1.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "LookLkViewController.h"

@interface LookLkViewController ()

@end

@implementation LookLkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.view.backgroundColor = [UIColor whiteColor];
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    _image.image = [UIImage imageNamed:@"8"];
    
    [self.view addSubview:_image];
    //    实例化一个label 对象
    _label = [[UILabel alloc]initWithFrame:CGRectMake(37.5, 140, 300, 500)];
    _label.font = [UIFont fontWithName:@"Arial" size:15];
    //    设置显示的文本行数
    _label.numberOfLines = 20;
    //    实例化一个 NSUserDefaults对象 存值
    NSUserDefaults *uu = [NSUserDefaults standardUserDefaults];
    _label.text = [uu valueForKey:@"keyI"];
    //    设置字体颜色
    _label.textColor = [UIColor blackColor];
    //    设置文字居中
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
    
    //    实例化一个labelI对象
    _labelI = [[UILabel alloc]initWithFrame:CGRectMake(37.50, 120, 300, 20)];
    
    _labelI.font = [UIFont fontWithName:@"Arial" size:18];
    //    设置显示的文本行数
    _labelI.numberOfLines = 15;
    //    实例化一个 NSUserDefaults对象 存值
    NSUserDefaults *uuI = [NSUserDefaults standardUserDefaults];
    
    _labelI.text = [uuI valueForKey:@"key"];
    
    //    设置字体颜色
    _labelI.textColor = [UIColor blackColor];
    //    设置文字居中
    _labelI.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_labelI];
    
    
    //    实例化一个UIButton对象 进行点击跳转页面的功能
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 40, 20)];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
