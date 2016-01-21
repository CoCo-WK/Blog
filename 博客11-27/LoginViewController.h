//
//  LoginViewController.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
#import "RegisterViewController.h"

@interface LoginViewController : UIViewController
@property(nonatomic,strong)UILabel *labelAccount;
@property(nonatomic,strong)UILabel *labelSecret;
@property(nonatomic,strong)UITextField *textAccount;
@property(nonatomic,strong)UITextField *textSecret;
@property(nonatomic,strong)UIButton *buttonEnter;
@property(nonatomic,strong)UIButton *buttonRegister;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIImageView *imageI;
@property(nonatomic,strong)UILabel *promptLabel;
@property(nonatomic,strong)RegisterViewController *registerView;
-(void)promptMessage:(NSString *)string;
@end
