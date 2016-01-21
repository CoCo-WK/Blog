//
//  ViewController.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LookLookController.h"
#import "WriteViewController.h"

@interface ViewController : UIViewController
@property(nonatomic,strong)UILabel *messageLabel;
@property(nonatomic,strong)UIButton *writeButton;
@property(nonatomic,strong)UIButton *registerButton;
@property(nonatomic,strong)UIButton *loginButton;
@property(nonatomic,strong)UIButton *quitButton;
@property(nonatomic,strong)NSUserDefaults *userDefault;
@property(nonatomic,strong)LoginViewController *loginView;
@property(nonatomic,strong)RegisterViewController *registerView;
@property(nonatomic,strong)LookLookController *lookView;
@property(nonatomic,strong)WriteViewController *writeView;
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UIImageView *image1;
@property(nonatomic,strong)UIButton *lookButton;
@property(nonatomic,strong)UILabel *adLabel;




@end

