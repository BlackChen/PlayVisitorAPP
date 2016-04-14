//
//  LoginViewController.m
//  PlayVisitorAPP
//
//  Created by   陈黔 on 16/3/5.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import "LoginViewController.h"

#import "HomeViewController.h"
#import "JoyViewController.h"
#import "OtherViewController.h"
#import "PersonViewController.h"

#import "UserAgreementViewController.h"
#import "ForgetPasswordViewController.h"

#import "IconView.h"
#import "UIButton+Bootstrap.h"
#import "RDVTabBarItem.h"

#import "UMSocialSnsPlatformManager.h"
#import "UMSocialAccountManager.h"

@interface LoginViewController ()<UITextFieldDelegate>{
    UITextField *accountName;
    UITextField *passWord;
    UIViewController *homeVC,*joyVC,*otherVC,*personVC,*userAgreementVC,*forgetPasswordVC;

//    本地
    NSUserDefaults *userDefaults;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationbar];
    userDefaults = [NSUserDefaults standardUserDefaults];
    [self setViewLayoutbyDesign];
    
    accountName = (UITextField *)[self.view viewWithTag:50];
    passWord = (UITextField *)[self.view viewWithTag:51];
}


- (void)setViewLayoutbyDesign{
//    icon
    IconView *iconView = [[IconView alloc]initWithFrame:AdaptCGRectMake(120, 90, 80, 80)];
    iconView.imageView.image = [UIImage imageNamed:@"111"];

    [self.view addSubview:iconView];
    
    NSArray *accoutTextt = @[@"请输入您的账号",@"请输入您的密码"];
//    NSArray *images = @[[UIImage imageNamed:@"user_name"],[UIImage imageNamed:@"password"]];
    for (int i = 0; i < 2; i ++) {
        UIView *accoutView = [[UIView alloc]initWithFrame:AdaptCGRectMake(50, 220+i*55, 220,38)];
        accoutView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
        accoutView.layer.cornerRadius = accoutView.frame.size.height/4;
        accoutView.layer.masksToBounds = YES;
        [self.view addSubview:accoutView];
        
        UITextField *accoutTextfield = [[UITextField alloc]initWithFrame:AdaptCGRectMake(30, 0, 180,38)];
//        UIImageView *imageView = [[UIImageView alloc]initWithImage:images[i]];
//        accoutTextfield.leftView = imageView;
        accoutTextfield.leftViewMode = UITextFieldViewModeAlways;
        accoutTextfield.placeholder = accoutTextt[i];
        accoutTextfield.clearsOnBeginEditing = YES;
        accoutTextfield.delegate = self;
        accoutTextfield.returnKeyType = UIReturnKeyNext;
        accoutTextfield.textColor=[UIColor purpleColor];
        accoutTextfield.tag = 50+i;
        accoutTextfield.font = [UIFont systemFontOfSize:16];
//        光标颜色
        accoutTextfield.tintColor = [UIColor blueColor];
        accoutTextfield.clearButtonMode=UITextFieldViewModeWhileEditing;
        accoutTextfield.backgroundColor=[UIColor clearColor];
        if (i==1) {
            accoutTextfield.secureTextEntry = YES;
            accoutTextfield.returnKeyType = UIReturnKeyDone;

        }
        [accoutView addSubview:accoutTextfield];
    }

    NSArray *titleArray = @[@"用户协议>>",@"自动登录"];
    NSArray *titleeArray = @[@"其它登录方式",@"忘记密码?"];
    for (int i = 0; i < 2; i ++) {
        UIButton *rememberAndTreatyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rememberAndTreatyButton.frame = AdaptCGRectMake(50+150*i, 320, 70, 15);
        [rememberAndTreatyButton setTitle:titleArray[i] forState:UIControlStateNormal];
        rememberAndTreatyButton.titleLabel.font = [UIFont systemFontOfSize:12];
        rememberAndTreatyButton.tag = i;
        
        if (i == 0) {
            //    用户协议
            rememberAndTreatyButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
            [rememberAndTreatyButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }else{
            //    记住密码？
            if ([[userDefaults objectForKey:@"loginState"] isEqual:@"YES"]) {
                rememberAndTreatyButton.selected = YES;
                [rememberAndTreatyButton setButtonIcon:FAIconOkSign Title:rememberAndTreatyButton.titleLabel.text beforeTitle:YES];
                [rememberAndTreatyButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }else{
                rememberAndTreatyButton.selected = NO;
            [rememberAndTreatyButton setButtonIcon:FAIconOff Title:rememberAndTreatyButton.titleLabel.text beforeTitle:YES];
            [rememberAndTreatyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            }
            rememberAndTreatyButton.titleEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
        }
        
        [rememberAndTreatyButton addTarget:self action:@selector(loginToHomeView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:rememberAndTreatyButton];
        
        //        其它登录方式/忘记密码
        UIButton *forgetAndOtherLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        forgetAndOtherLoginButton.frame = CGRectMake(5+i*(SCREEN_WIDTH-90), SCREEN_HEIGHT-25, 80, 20);
        [forgetAndOtherLoginButton setTitle:titleeArray[i] forState:UIControlStateNormal];
        forgetAndOtherLoginButton.titleLabel.font = [UIFont systemFontOfSize:12];
        forgetAndOtherLoginButton.tag = i+2;
        
        [forgetAndOtherLoginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        forgetAndOtherLoginButton.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [forgetAndOtherLoginButton addTarget:self action:@selector(loginToHomeView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:forgetAndOtherLoginButton];
    }
    
//    login
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = AdaptCGRectMake(45, 350, 230, 40);
    loginButton.backgroundColor = [UIColor purpleColor];
      loginButton.tag = 4;
    [loginButton addTarget:self action:@selector(loginToHomeView:) forControlEvents:UIControlEventTouchUpInside];
  
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor colorWithRed:53/255.0 green:170/255.0 blue:0.0 alpha:1] forState:UIControlStateNormal];
    
    
    loginButton.layer.cornerRadius = loginButton.frame.size.height/2;
    loginButton.layer.masksToBounds = YES;
    [self.view addSubview:loginButton];
}

- (void)loginToHomeView:(UIButton *)button{
    switch (button.tag) {
        case 0:
        {
            NSLog(@"用户协议");
            userAgreementVC = [[UserAgreementViewController alloc]init];
            [self.navigationController pushViewController:userAgreementVC animated:YES];
        }
            break;
        case 1:
        {
            if (button.selected != YES) {
                button.selected = YES;
                [button setButtonIcon:FAIconOkSign Title:@"自动登录" beforeTitle:YES];
                [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [userDefaults setObject:@"YES" forKey:@"loginState"];
            }else{
                button.selected = NO;
                [button setButtonIcon:FAIconOff Title:@"自动登录" beforeTitle:YES];
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [userDefaults removeObjectForKey:@"loginState"];
            }
            NSLog(@"自动登录%@",[userDefaults objectForKey:@"loginState"]);

        }
            break;
        case 2:
        {
            NSLog(@"其它登录方式");
            
            if (button.selected != YES) {
                button.selected = YES;
                [self addOtherWayOfLogin];
            }else{
                button.selected = NO;
                for (UIView *view in self.view.subviews) {
                    if (view.tag >= 100) {
                        [view removeFromSuperview];
                    }
                }
            }
        }
            break;
        case 3:
        {
            NSLog(@"忘记密码？");
            forgetPasswordVC = [[ForgetPasswordViewController alloc]init];
            [self.navigationController pushViewController:forgetPasswordVC animated:YES];
        }
            break;
        case 4:
        {
            NSLog(@"登录");
            if (accountName.text.length == 0 && passWord.text.length != 0) {
                [self alertViewWithTitle:@"Tips" message:@"请检查用户名是否正确!" btTitle:@"OK"];
            }else if (passWord.text.length == 0 && accountName.text.length != 0){
                [self alertViewWithTitle:@"Tips" message:@"请输入正确的密码!" btTitle:@"OK"];
            }else if (passWord.text.length == 0 || accountName.text.length == 0){
                [self alertViewWithTitle:@"Tips" message:@"请输入正确的用户名和密码！" btTitle:@"OK"];
            }else{
                [self loadDate:accountName.text and:passWord.text];
            }
        }
            break;
            case 100:
        {
            NSLog(@"qq登录");
            
            
            
            UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
            
            snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
                
                //          获取微博用户名、uid、token等
                
                if (response.responseCode == UMSResponseCodeSuccess) {
                    
                    UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
                    
                    NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
                    
                }});
        }
            break;
        case 101:
        {
            NSLog(@"微信登录");
        }
            break;
        case 102:
        {
            NSLog(@"新浪微博登录");
            // 使用Sina微博账号登录
            UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
            snsPlatform.loginClickHandler(self, [UMSocialControllerService defaultControllerService], YES, ^(UMSocialResponseEntity *response) {
                NSLog(@"response is %@", response);
                // 如果是授权到新浪微博，SSO之后如果想获取用户的昵称、头像等需要再获取一次账户信息
                [[UMSocialDataService defaultDataService]requestSocialAccountWithCompletion:^(UMSocialResponseEntity *response) {
                    // 打印用户昵称
                    NSLog(@"SinaWeibo's user name is %@", [[[response.data objectForKey:@"accounts"]objectForKey:UMShareToSina] objectForKey:@"username"]);
                }];
            });
        }
            break;
        case 103:
        {
            NSLog(@"人人登录");
        }
            break;
        default:
            break;
    }
}

- (void)addOtherWayOfLogin{
    UILabel *otherLoginlable = [[UILabel alloc]initWithFrame:AdaptCGRectMake(30, 420, 120, 20)];
    otherLoginlable.text = @"你想用哪种方式登录？";
    otherLoginlable.textColor = [UIColor purpleColor];
    otherLoginlable.font = [UIFont systemFontOfSize:13];
    otherLoginlable.tag = 120;
    [self.view addSubview:otherLoginlable];
    for (int i = 0; i < 4; i ++) {
        UIButton *otherLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        otherLoginButton.frame = AdaptCGRectMake(25+70*i, 450, 60, 60);
        otherLoginButton.backgroundColor = [UIColor redColor];
        otherLoginButton.tag = 100 + i;
        otherLoginButton.layer.cornerRadius = otherLoginButton.frame.size.height/4;
        otherLoginButton.layer.cornerRadius = YES;
        [otherLoginButton addTarget:self action:@selector(loginToHomeView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:otherLoginButton];
    }
}

- (void)loadDate:(NSString*)accoutName and:(NSString*)password{
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"loginState"];
    NSString *loginStatusStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginState"];
    if ([loginStatusStr isEqual:@"1"]) {
        [self setViewControllers];
        UIApplication.sharedApplication.delegate.window.rootViewController = _tabBarVC;
    }
}

- (void)setViewControllers{
    homeVC = [[HomeViewController alloc]init];
    homeVC.title = @"首页";
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    joyVC = [[JoyViewController alloc]init];
    joyVC.title = @"兴趣";
    UINavigationController *joyNav = [[UINavigationController alloc]initWithRootViewController:joyVC];
    
    otherVC = [[OtherViewController alloc]init];
    otherVC.title = @"其它";
    UINavigationController *otherNav = [[UINavigationController alloc]initWithRootViewController:otherVC];
    
    personVC = [[PersonViewController alloc]init];
    personVC.title = @"我的";
    UINavigationController *personNav = [[UINavigationController alloc]initWithRootViewController:personVC];
    
    self.tabBarVC = [[RDVTabBarController alloc]init];
    [self.tabBarVC setViewControllers:@[homeNav, joyNav, otherNav, personNav]];
    self.tabBarVC.tabBar.translucent = YES;
    [self.tabBarVC setHidesBottomBarWhenPushed:YES];

    [self customizeTabBarForController:self.tabBarVC];
}

//书签
- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third", @"four"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        [item setSelectedTitleAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName: [UIColor purpleColor],}];
        
        [item setUnselectedTitleAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:13],NSForegroundColorAttributeName: [UIColor purpleColor],}];
        
        index++;
    }
}

//设置navigationBar
-(void)setNavigationbar{
    self.title=@"登录";
    self.view.backgroundColor=[UIColor cyanColor];
    
    //按钮2
    UIBarButtonItem *searchItem=[[UIBarButtonItem alloc]initWithTitle:@"㊙️" style:UIBarButtonItemStylePlain target:self action:@selector(searchCircle)];
    //设置按钮颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem= searchItem;
}

//警告
- (void)alertViewWithTitle:(NSString *)string message:(NSString *)message btTitle:(NSString *)btTitle{
    UIAlertView *_alertView = [[UIAlertView alloc] initWithTitle:string message:message delegate:nil cancelButtonTitle:btTitle otherButtonTitles:nil, nil];
    [_alertView show];
}

- (void)searchCircle{
    NSLog(@"详情");
}

//UITextFieldDelegate
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //TODO: 键盘右下角按键操作,怎么换行 ？
    if (textField.tag == 51) {
//        [self loginToHomeView:];
    }
    [textField resignFirstResponder];
    return YES;
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
