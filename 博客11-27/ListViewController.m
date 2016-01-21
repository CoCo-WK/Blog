//
//  ListViewController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/27.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "ListViewController.h"
#import "Article.h"
#import "User.h"
#import "LookViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController
-(void)viewDidAppear:(BOOL)animated{
    Article *artic = [[Article alloc]init];
    _arrayContent = [artic showListMethod];
    [_listTable reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayContent=[NSMutableArray array];
    Article *artic=[[Article alloc]init];
    _arrayContent=[artic showListMethod];
    _listTable = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStyleGrouped];
    
    _listTable.delegate = self;
    _listTable.dataSource = self;
    
    
    
    
    [self.view addSubview:_listTable];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_arrayContent count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = _arrayContent[indexPath.row][@"title"];
    User *user = [[User alloc]init];
    NSString *userName=[user findName:_arrayContent[indexPath.row][@"userId"]];

    NSString *sumText=[NSString stringWithFormat:@"%@      %@",_arrayContent[indexPath.row][@"time"],userName];
    cell.detailTextLabel.text = sumText;
    
    return cell;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        UIView *lkView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,375, 150)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, 40, 20)];
        _imageI = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 150)];
        
        _imageI.image = [UIImage imageNamed:@"19"];

        label.text = @"标题";
        [lkView addSubview:_imageI];
        [lkView addSubview:label];
        
        return lkView;
    }
    
    _labelI = [[UILabel alloc]init];
    return _labelI;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 150;
    }
    return 30;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger a=(long)[indexPath row];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    Article *data = [[Article alloc]init];
    array=[data showListMethod];
    NSLog(@"%@",array[a]);
    NSUserDefaults *userDefault = [[NSUserDefaults alloc]init];
    [userDefault setValue:_arrayContent[indexPath.row][@"title"] forKey:@"title"];
    [userDefault setValue:_arrayContent[indexPath.row][@"content"] forKey:@"content"];
    [userDefault synchronize];
    
    
    _lookView = [[LookViewController alloc]init];
    [self presentViewController:_lookView animated:YES completion:nil];

    
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
