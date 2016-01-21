//
//  WriteViewController.h
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/30.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteViewController : UIViewController
@property(nonatomic,strong)UILabel *headLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIButton *publishButton;
@property(nonatomic,strong)UITextView *contentText;
@property(nonatomic,strong)UITextField *titleField;
@property(nonatomic,strong)UIImageView *image;
@end
