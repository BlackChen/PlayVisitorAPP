//
//  SettingViewController.m
//  PlayVisitorAPP
//
//  Created by BlackChen on 16/3/18.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewWillAppear:(BOOL)animated{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    RDVTabBarController *tabBarVC = (RDVTabBarController *)appDelegate.window.rootViewController;
    tabBarVC.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationbar];
    [self addTabViewOfSetting];
}

//表视图
- (void)addTabViewOfSetting{
    self.mTableView = [[TQMultistageTableView alloc] initWithFrame:AdaptCGRectMake(0, 20, 320,568-64)];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    [self.view addSubview:self.mTableView];
}

//设置navigationBar
-(void)setNavigationbar{
    self.view.backgroundColor=[UIColor whiteColor];
    //按钮
    UIBarButtonItem *searchItem=[[UIBarButtonItem alloc]initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(searchCircle)];
    //设置按钮颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem= searchItem;
}

- (void)searchCircle{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark TQTableViewDelegate,DataSource
- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)mTableView:(TQMultistageTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    UIView *VIEW = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    VIEW.backgroundColor = [UIColor redColor];
    [cell addSubview:VIEW];
    return cell;
}


- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *VIEW = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    VIEW.backgroundColor = [UIColor greenColor];
    return VIEW;
}

- (UIView *)mTableView:(TQMultistageTableView *)tableView openCellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIView *view = [[UIView alloc]init];
    return view;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (void)mTableView:(TQMultistageTableView *)tableView didSelectHeaderAtSection:(NSInteger)section{
    NSLog(@"%ld",(long)section);
}

- (void)mTableView:(TQMultistageTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
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
