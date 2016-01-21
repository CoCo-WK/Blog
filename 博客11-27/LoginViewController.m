//
//  LoginViewController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

#import "RegisterViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _labelAccount = [[UILabel alloc]initWithFrame:CGRectMake(16, 220, 34, 21)];
    _labelSecret = [[UILabel alloc]initWithFrame:CGRectMake(16, 293, 34, 21)];
    _textAccount = [[UITextField alloc]initWithFrame:CGRectMake(79, 217, 220, 30)];
    _textSecret = [[UITextField alloc]initWithFrame:CGRectMake(79, 289, 220, 30)];
    _buttonEnter = [[UIButton alloc]initWithFrame:CGRectMake(74, 380, 41, 30)];
    _buttonRegister = [[UIButton alloc]initWithFrame:CGRectMake(243, 380, 46, 30)];
    _backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 50, 70, 30)];

    [_buttonEnter setTitle:@"登录" forState:UIControlStateNormal];
    [_buttonEnter setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _buttonEnter.layer.borderColor = [UIColor blackColor].CGColor;
    _buttonEnter.layer.borderWidth = 1;
    _buttonEnter.layer.cornerRadius = 5;
    [_buttonEnter addTarget:self action:@selector(enterButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_buttonRegister setTitle:@"注册" forState:UIControlStateNormal];
    [_buttonRegister setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _buttonRegister.layer.borderColor = [UIColor blackColor].CGColor;
    _buttonRegister.layer.borderWidth = 1;
    _buttonRegister.layer.cornerRadius = 5;
    [_buttonRegister addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    
    
    _labelAccount.text = @"账户";
    _textAccount.layer.borderWidth = 1;
    _textAccount.layer.borderColor = [UIColor blackColor].CGColor;
    _textAccount.layer.cornerRadius = 9;
    
    _labelSecret.text = @"密码";
    _textSecret.layer.borderWidth = 1;
    _textSecret.layer.borderColor = [UIColor blackColor].CGColor;
    _textSecret.layer.cornerRadius = 9;
    _textSecret.secureTextEntry = YES;
    
    [_backButton setTitle:@"⬅️back" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _backButton.layer.borderColor = [UIColor blackColor].CGColor;
    _backButton.layer.borderWidth = 1;
    _backButton.layer.cornerRadius = 5;
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    _imageI = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 375, 667)];
    _promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 335, 170, 28)];
    _imageI.image = [UIImage imageNamed:@"7"];
    [self.view addSubview:_promptLabel];
    [self.view addSubview:_imageI];
    [self.view addSubview:_textAccount];
    [self.view addSubview:_textSecret];
    [self.view addSubview:_labelAccount];
    [self.view addSubview:_labelSecret];
    [self.view addSubview:_buttonEnter];
    [self.view addSubview:_buttonRegister];
    [self.view addSubview:_backButton];
   



}
-(void)promptMessage:(NSString *)string{
    _promptLabel.text = string;
    _promptLabel.textAlignment=NSTextAlignmentCenter;
    _promptLabel.textColor=[UIColor redColor];
    _promptLabel.layer.borderWidth=2;
    _promptLabel.layer.borderColor=[[UIColor alloc]initWithRed:0.2 green:0.4 blue:0.7 alpha:0.2].CGColor;
    _promptLabel.layer.cornerRadius=10;
    
}

-(void)regist{
    _registerView = [[RegisterViewController alloc]init];
    [self presentViewController:_registerView animated:YES completion:nil];
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)enterButton{
    if (![_textAccount.text isEqualToString:@""]){
       if(![_textSecret.text isEqualToString:@""])
       {
        User *user=[[User alloc]init];
        NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
        NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:10];
        array=[user loginMethod:_textAccount.text andPassword:_textSecret.text];
        NSLog(@"%@", array);
        NSString *name=array[1];
        NSString *userId=array[0];

        [userDefault setValue:userId forKey:@"id"];
        [userDefault setValue:name forKey:@"name"];
        [userDefault synchronize];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示框" message:@"登录成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];

        [self dismissViewControllerAnimated:NO completion:nil];
       }
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示框" message:@"密码或账号错误" delegate:nil cancelButtonTitle:@"错误" otherButtonTitles: nil];
        [alert show];

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
