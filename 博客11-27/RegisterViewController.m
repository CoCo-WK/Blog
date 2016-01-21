//
//  RegisterViewController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "RegisterViewController.h"
#import "User.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _labelHead = [[UILabel alloc]initWithFrame:CGRectMake(142, 41, 69, 21)];
    _accountLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 102, 34, 21)];
    _labelName = [[UILabel alloc]initWithFrame:CGRectMake(40, 182, 34, 21)];
    _secretLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 258, 34, 21)];
    _labelAgain = [[UILabel alloc]initWithFrame:CGRectMake(27, 337, 80, 21)];
    _accountField = [[UITextField alloc]initWithFrame:CGRectMake(104, 99, 209, 30)];
    _fieldName = [[UITextField alloc]initWithFrame:CGRectMake(104, 178, 209, 30)];
    _secretField = [[UITextField alloc]initWithFrame:CGRectMake(104, 254, 209, 30)];
    _fieldAgain = [[UITextField alloc]initWithFrame:CGRectMake(104, 333, 209, 30)];
    _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(168, 436, 39, 30)];
    _backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 50, 70, 30)];
    _labelHead.text = @"注册信息";
    _labelName.text = @"姓名";
    _labelAgain.text = @"确认密码";
    _accountLabel.text = @"账户";
    _secretLabel.text = @"密码";
    _fieldName.layer.borderWidth = 1;
    _fieldName.layer.borderColor = [UIColor blackColor].CGColor;
    _fieldName.layer.cornerRadius = 9;
    _fieldAgain.layer.borderWidth = 1;
    _fieldAgain.layer.borderColor = [UIColor blackColor].CGColor;
    _fieldAgain.layer.cornerRadius = 9;
    _accountField.layer.borderWidth = 1;
    _accountField.layer.borderColor = [UIColor blackColor].CGColor;
    _accountField.layer.cornerRadius = 9;
    _secretField.layer.borderWidth = 1;
    _secretField.layer.borderColor = [UIColor blackColor].CGColor;
    _secretField.layer.cornerRadius = 9;
    _fieldName.placeholder = @"请输入姓名";
    _fieldAgain.placeholder = @"请再次输入密码";
    _accountField.placeholder = @"请输入账户名（6-12位）";
    _secretField.placeholder = @"请输入密码";
    
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _registerButton.layer.borderWidth = 1;
    _registerButton.layer.borderColor = [UIColor blackColor].CGColor;
    _registerButton.layer.cornerRadius = 5;
    [_registerButton addTarget:self action:@selector(registerMethod) forControlEvents:UIControlEventTouchUpInside];
    
    [_backButton setTitle:@"⬅️back" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _backButton.layer.borderColor = [UIColor blackColor].CGColor;
    _backButton.layer.borderWidth = 1;
    _backButton.layer.cornerRadius = 5;
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    _imageIII = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    _imageIII.image = [UIImage imageNamed:@"21"];
    
    _promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 335, 170, 28)];
    
    [self.view addSubview:_promptLabel];
    [self.view addSubview:_imageIII];
    [self.view addSubview:_labelHead];
    [self.view addSubview:_labelName];
    [self.view addSubview:_labelAgain];
    [self.view addSubview:_accountLabel];
    [self.view addSubview:_secretLabel];
    [self.view addSubview:_fieldName];
    [self.view addSubview:_fieldAgain];
    [self.view addSubview:_accountField];
    [self.view addSubview:_secretField];
    [self.view addSubview:_registerButton];
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

-(void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)registerMethod{
    User *user=[[User alloc]init];
    NSString * userAccount=_accountField.text;
    NSString *userPassword=_secretField.text;
    NSString *userAgain=_fieldAgain.text;
    NSString *userNickName=_fieldName.text;
    if ([userAccount length]>=6&&[userAccount length]<=16&&[userPassword length]>=6&&[userPassword length]<=16&&[userAgain length]>=6&&[userAgain length]<=16&&[userNickName length]>=6&&[userNickName length]<=16) {
        if ([userPassword isEqualToString:userAgain]) {
            
            if ([user jugdeExist:userAccount]) {
                NSLog(@"账号存在");
                
            }else{
                [user insertMessageWithAccount:_accountField.text andPassword:_secretField.text andNickName:_fieldName.text];
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示框" message:@"注册成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];

                [self dismissViewControllerAnimated:NO completion:nil];
                
            }
            
        }
        else{
            NSLog(@"两次密码输入不一致");
        }
        
    }else {
        NSLog(@"信息填写不正确");
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
