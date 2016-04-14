//
//  PersonViewController.m
//  PlayVisitorAPP
//
//  Created by BlackChen on 16/3/18.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import "PersonViewController.h"
#import "SettingViewController.h"
#import "IconView.h"
@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PersonViewController

- (void)viewWillAppear:(BOOL)animated{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    RDVTabBarController *tabBarVC = (RDVTabBarController *)appDelegate.window.rootViewController;
    tabBarVC.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationbar];
    [self setViewLayoutbyDesign];

    
}

- (void)setViewLayoutbyDesign{
    IconView *iconView = [[IconView alloc]initWithFrame:AdaptCGRectMake(120, 80, 80, 100)];
    iconView.imageView.image = [UIImage imageNamed:@"111"];
    iconView.iconLable.text = @"BlackChen";
    [self.view addSubview:iconView];
    
    UITableView *personTableView = [[UITableView alloc]initWithFrame:AdaptCGRectMake(0, 180, 320, 568-180) style:UITableViewStyleGrouped];
    personTableView.dataSource = self;
    personTableView.delegate = self;
    [self.view addSubview:personTableView];
}

#pragma mark ---- tableview delegate datasourse
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    tableViewCell.backgroundColor = [UIColor redColor];
    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"1");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor yellowColor];
    return view;
}
//设置navigationBar
-(void)setNavigationbar{
    self.view.backgroundColor=[UIColor whiteColor];
    //按钮2
    UIBarButtonItem *searchItem=[[UIBarButtonItem alloc]initWithTitle:@"🛠" style:UIBarButtonItemStylePlain target:self action:@selector(searchCircle)];
    //设置按钮颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem= searchItem;
}

- (void)searchCircle{
    NSLog(@"设置");
    SettingViewController *settingVC = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:settingVC animated:YES];
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
