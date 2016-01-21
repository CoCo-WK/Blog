//
//  WriteViewController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/30.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "WriteViewController.h"
#import "Article.h"
#import "TabBarViewController.h"
@interface WriteViewController ()

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _image = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _headLabel = [[UILabel alloc]initWithFrame:CGRectMake(161, 80, 60, 21)];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(31, 129, 51, 21)];
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(31, 167, 51, 21)];
    _titleField = [[UITextField alloc]initWithFrame:CGRectMake(82, 126, 245, 30)];
    _contentText = [[UITextView alloc]initWithFrame:CGRectMake(35, 200, 300, 400)];
    _publishButton = [[UIButton alloc]initWithFrame:CGRectMake(290, 609, 50, 30)];
    _backButton = [[UIButton alloc]initWithFrame:CGRectMake(16, 20, 40, 30)];
    _image.image = [UIImage imageNamed:@"30"];
    _headLabel.text = @"发表";
    _headLabel.font = [UIFont fontWithName:@"Arial" size:30];
    _titleLabel.text = @"标题";
    _contentLabel.text = @"内容";
    [_publishButton setTitle:@"发表" forState:UIControlStateNormal];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_publishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _publishButton.layer.borderColor = [UIColor blackColor].CGColor;
    _publishButton.layer.borderWidth = 1;
    _publishButton.layer.cornerRadius = 5;
    [_publishButton addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
    
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _backButton.layer.borderColor = [UIColor blackColor].CGColor;
    _backButton.layer.borderWidth = 1;
    _backButton.layer.cornerRadius = 5;
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    _titleField.layer.borderWidth = 1;
    _titleField.layer.borderColor = [UIColor blackColor].CGColor;
    _titleField.layer.cornerRadius = 9;
    
    _contentText.layer.borderWidth = 1;
    _contentText.layer.borderColor = [UIColor blackColor].CGColor;
    _contentText.layer.cornerRadius = 9;

    [self.view addSubview:_image];
    [self.view addSubview:_headLabel];
    [self.view addSubview:_titleField];
    [self.view addSubview:_contentText];
    [self.view addSubview:_contentLabel];
    [self.view addSubview:_publishButton];
    [self.view addSubview:_backButton];
    [self.view addSubview:_titleLabel];
    
    
    
    
    
    
}
-(void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)publish{
    Article *artic=[[Article alloc]init];
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *userId=[userDefault valueForKey:@"id"];
    NSLog(@"%@",userId);
    [artic insertMessageWithTitle:_titleField.text andContent:_contentText.text andId:userId];
    
    
    
    NSArray *arr = @[@1];
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setValue: arr[0] forKey:@"user"];
    TabBarViewController *backView= [[TabBarViewController alloc]init];
    [self presentViewController:backView animated:NO completion:nil];
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
