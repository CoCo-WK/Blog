//
//  ViewController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "ViewController.h"
#import "Article.h"
#import "User.h"

@interface ViewController ()
@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated{
    _userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userName = [_userDefault valueForKey:@"name"];
    if (userName == nil) {
        _messageLabel.text = @"Hello 发表请登录";
        _loginButton.hidden = NO;
        _registerButton.hidden = NO;
        _writeButton.hidden = YES;
        _quitButton.hidden = YES;
    }else{
        _messageLabel.text=[NSString stringWithFormat:@"用户：%@,welcome to bobo",userName];
        _loginButton.hidden=YES;
        _registerButton.hidden=YES;
        _writeButton.hidden=NO;
        _quitButton.hidden=NO;

    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 280, 60, 30)];
    _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(195, 280, 60, 30)];
    _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 20, 300, 20)];
    _writeButton = [[UIButton alloc]initWithFrame:CGRectMake(195, 280, 60, 30)];
    _quitButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 280, 60, 30)];
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 657)];
    _image1 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 140, 140, 130)];
    _lookButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 280, 120, 30)];
    
    [_lookButton setTitle:@"随便看看" forState:UIControlStateNormal];
    [_lookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _lookButton.backgroundColor = [UIColor whiteColor];
    _lookButton.layer.borderWidth = 1;
    _lookButton.layer.borderColor = [UIColor blackColor].CGColor;
    _lookButton.layer.cornerRadius = 5;
    [_lookButton addTarget:self action:@selector(lookLook) forControlEvents:UIControlEventTouchUpInside];
    
    _image.image = [UIImage imageNamed:@"1"];
    _image1.image = [UIImage imageNamed:@"2"];
    _messageLabel.text = @"hehe";
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _registerButton.layer.borderWidth = 1;
    _registerButton.layer.borderColor = [UIColor blackColor].CGColor;
    _registerButton.layer.cornerRadius = 5;
    [_registerButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _loginButton.layer.borderWidth = 1;
    _loginButton.layer.borderColor = [UIColor blackColor].CGColor;
    _loginButton.layer.cornerRadius = 5;
    [_loginButton addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
    
    [_writeButton setTitle:@"发表" forState:UIControlStateNormal];
    [_writeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _writeButton.layer.borderWidth = 1;
    _writeButton.layer.borderColor = [UIColor redColor].CGColor;
    _writeButton.layer.cornerRadius = 5;
    [_writeButton addTarget:self action:@selector(write) forControlEvents:UIControlEventTouchUpInside];
    _writeButton.hidden = YES;

    [_quitButton setTitle:@"注销" forState:UIControlStateNormal];
    [_quitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _quitButton.layer.borderWidth = 1;
    _quitButton.layer.borderColor = [UIColor redColor].CGColor;
    _quitButton.layer.cornerRadius = 5;
    [_quitButton addTarget:self action:@selector(delet) forControlEvents:UIControlEventTouchUpInside];
    _quitButton.hidden = YES;
    
    _adLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 420, 160, 20)];
    _adLabel.text = @"一起来发条博客吧~~";
    _adLabel.textColor = [UIColor grayColor];
    _adLabel.textAlignment = NSTextAlignmentCenter;


    [self.view addSubview:_image];
    [self.view addSubview:_image1];
    [self.view addSubview:_registerButton];
    [self.view addSubview:_loginButton];
    [self.view addSubview:_writeButton];
    [self.view addSubview:_quitButton];
    [self.view addSubview:_messageLabel];
    [self.view addSubview:_lookButton];
    [self.view addSubview:_adLabel];
    

}
-(void)write{
    _writeView = [[WriteViewController alloc]init];
    [self presentViewController:_writeView animated:YES completion:nil];
}
-(void)enter{
    _loginView = [[LoginViewController alloc]init];
    [self presentViewController:_loginView animated:YES completion:nil];
    
}
-(void)regist{
    _registerView = [[RegisterViewController alloc]init];
    [self presentViewController:_registerView animated:YES completion:nil];
}
-(void)delet{
    [_userDefault removeObjectForKey:@"name"];
    _messageLabel.text=@"Hello 发表请登录";
    _loginButton.hidden=NO;
    _registerButton.hidden=NO;
    _writeButton.hidden=YES;
    _quitButton.hidden=YES;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)lookLook{
    _lookView = [[LookLookController alloc]init];
    [self presentViewController:_lookView animated:YES completion:nil];

    
}

@end
