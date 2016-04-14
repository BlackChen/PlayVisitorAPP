//
//  SettingViewController.h
//  PlayVisitorAPP
//
//  Created by BlackChen on 16/3/18.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMultistageTableView.h"

@interface SettingViewController : UIViewController<TQTableViewDelegate,TQTableViewDataSource>

@property (nonatomic, strong) TQMultistageTableView *mTableView;
@property (nonatomic, copy)NSString *cacheData;
@property (nonatomic, copy)NSString *acountName;
@property (nonatomic, strong) UILabel *introduceTextView;
@end
