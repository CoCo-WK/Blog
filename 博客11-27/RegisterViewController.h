//
//  RegisterViewController.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegisterViewController : UIViewController
@property(nonatomic,strong)UILabel *labelHead;
@property(nonatomic,strong)UILabel *labelName;
@property(nonatomic,strong)UILabel *labelAgain;
@property(nonatomic,strong)UILabel *accountLabel;
@property(nonatomic,strong)UILabel *secretLabel;
@property(nonatomic,strong)UITextField *fieldName;
@property(nonatomic,strong)UITextField *fieldAgain;
@property(nonatomic,strong)UITextField *accountField;
@property(nonatomic,strong)UITextField *secretField;
@property(nonatomic,strong)UIButton *registerButton;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIImageView *imageIII;
@property(nonatomic,strong)UILabel *promptLabel;


@end
