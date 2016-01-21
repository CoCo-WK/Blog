//
//  LookViewController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/30.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "LookViewController.h"
#import "Article.h"

@interface LookViewController ()

@end

@implementation LookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _image = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _headLabel = [[UILabel alloc]initWithFrame:CGRectMake(161, 80, 60, 21)];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(31, 129, 51, 21)];
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(31, 167, 51, 21)];
    _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(98, 126, 245, 30)];
    _labelContent = [[UILabel alloc]initWithFrame:CGRectMake(45, 190, 300, 380)];
    _backButton = [[UIButton alloc]initWithFrame:CGRectMake(16, 20, 50, 30)];
    _image.image = [UIImage imageNamed:@"99"];
    _headLabel.text = @"博文";
    _headLabel.font = [UIFont fontWithName:@"Arial" size:30];
    _titleLabel.text = @"标题";
    _contentLabel.text = @"正文";
    
    _labelContent.numberOfLines = 20;
    _labelTitle.layer.borderWidth = 1;
    _labelTitle.layer.borderColor = [UIColor blackColor].CGColor;
    _labelTitle.layer.cornerRadius = 9;
    
    _labelContent.layer.borderWidth = 1;
    _labelContent.layer.borderColor = [UIColor blackColor].CGColor;
    _labelContent.layer.cornerRadius = 9;


    [_backButton setTitle:@"⬅️⬅️" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _backButton.layer.borderColor = [UIColor blackColor].CGColor;
    _backButton.layer.borderWidth = 1;
    _backButton.layer.cornerRadius = 5;
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:_image];
    [self.view addSubview:_titleLabel];
    [self.view addSubview:_labelContent];
    [self.view addSubview:_contentLabel];
    [self.view addSubview:_labelTitle];
    [self.view addSubview:_backButton];
    [self.view addSubview:_headLabel];
    
    
    NSMutableArray *array=[[NSMutableArray alloc]init];
    Article *data = [[Article alloc]init];
    array=[data showListMethod];
    NSInteger a=(long)[array count];
    _labelTitle.text = array[a-1][@"title"];
    _labelContent.text = array[a-1][@"content"];
    
    NSUserDefaults *userDefault = [[NSUserDefaults alloc]init];
    _labelTitle.text = [userDefault valueForKey:@"title"];
    _labelContent.text = [userDefault valueForKey:@"content"];

    
}
-(void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
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
