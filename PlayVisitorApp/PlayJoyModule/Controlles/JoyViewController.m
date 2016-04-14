//
//  JoyViewController.m
//  PlayVisitorAPP
//
//  Created by BlackChen on 16/3/18.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import "JoyViewController.h"

@interface JoyViewController ()

@end

@implementation JoyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //按钮2
    UIBarButtonItem *searchItem=[[UIBarButtonItem alloc]initWithTitle:@"🎨" style:UIBarButtonItemStylePlain target:self action:@selector(searchCircle)];
    //设置按钮颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem= searchItem;
}

- (void)searchCircle{
    NSLog(@"更多");
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
