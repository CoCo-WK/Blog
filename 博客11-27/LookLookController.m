//
//  LookLookController.m
//  博客11-27
//
//  Created by 非凡程序员 on 15/11/28.
//  Copyright (c) 2015年 王珂. All rights reserved.
//

#import "LookLookController.h"

@interface LookLookController ()

@end

@implementation LookLookController

- (void)viewDidLoad {
    [super viewDidLoad];

    _lookView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
    
    _lookView.delegate = self;
    _lookView.dataSource = self;
    
    _arrI = @[@"独处也是一种能力 -- 周国平",@"我想结交一些有趣的灵魂 -- 李银河",@"人为什么要保持纯净之心？ -- 李银河"];
    
    _arrII = @[@"      独处是人生中的美好时刻和美好体验，虽则有些寂寞，寂寞中却又有一种充实。独处是灵魂生长的必要空间，在独处时，我们从别人和事务中抽身出来，回到了自己。这时候，我们独自面对自己和上帝，开始了与自己的心灵以及与宇宙中的神秘力量的对话。一切严格意义上的灵魂生活都是在独处时展开的。和别人一起谈古说今，引经据典，那是闲聊和讨论；唯有自己沉浸于古往今来大师们的杰作之时，才会有真正的心灵感悟。和别人一起游山玩水，那只是旅游；唯有自己独自面对苍茫的群山和大海之时，才会真正感受到与大自然的沟通。人们往往把交往看作一种能力，却忽略了独处也是一种能力，并且在一定意义。",@"      外面的世界热闹非凡，人群熙熙攘攘，嘤嘤嗡嗡，惶惶然不可终日。我却一人凝神静思，对外面的扰攘充耳不闻。有时，在海边散步，遇到一群人在热烈地说着什么，话音敲击我的耳膜，就像鸟的呢喃，就像海涛拍岸，没有一字一句对我来说有意义。从宏观角度看，他们对于我来说并不存在；我对于他们来说，也不存在。盖因我们虽然相遇，但是灵魂并未有交集。人在世间，灵魂有交集的人不过十数人而已，有的人仅限于亲人，有的人加上恋人，还有人加上友人，仅此而已，岂有他哉。人的写作和出版使得灵魂似乎与一些陌生人得以交集，那就是那些对你的灵魂感到一些共鸣的人。但是去刻意认识一位作家是最无意义的事情，如钱锺书所说，吃鸡蛋就好，何必认识母鸡？我只想在世上结交一些有趣的灵魂，偶尔交流一下，剩下的时间就一个人呆着，自娱自乐，自说自话，自由自在",@"      人为什么要保持纯净之心？因为只有心是纯净的，才可能是安适的。如果有谋权的念头，有谋利的念头，有求名的念头，则内心必定不再纯净，就没有安宁可言。因为只有心是纯净的，才可能是优雅的。如果有肮脏的念头，有贪婪的念头，有嫉妒的念头，则内心必定不再纯净，就没有优雅可言。因为只有心是纯净的，才可能是快乐的。如果有钻营的念头，有计较的念头，有攀比的念头，则内心必定不再纯净，就没有快乐可言。"];
    

    _imageIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 150)];
    _imageIV.image = [UIImage imageNamed:@"10"];
    
    [self.view addSubview:_lookView];
    [_lookView addSubview:_imageIV];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _arrI.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
        cell.textLabel.text = _arrI[indexPath.row];
        cell.detailTextLabel.text = _arrII[indexPath.row];
        

        
    }
    
    return cell;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        UIView *lkView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,375, 150)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, 40, 20)];
        UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake( 0 , 20 , 40, 20)];
        label.text = @"标题";
        [backButton setTitle:@"⬅️" forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [lkView addSubview:label];
        [lkView addSubview:backButton];
        return lkView;
        }

    _labelI = [[UILabel alloc]init];
    _labelI.frame=CGRectMake(15, 5, 10, 10);
    return _labelI;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:_arrI[indexPath.row] forKey:@"key"];
    [user setValue:_arrII[indexPath.row] forKey:@"keyI"];
    
    [user synchronize];

    _lk = [[LookLkViewController alloc]init];
    [self presentViewController:_lk animated:NO completion:nil];
    
    
    
    
    
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
