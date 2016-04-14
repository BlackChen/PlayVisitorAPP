//
//  VideoCellCode.h
//  PlayVisitorAPP
//
//  Created by BlackChen on 16/3/24.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface VideoCellCode : UITableViewCell
//标题
@property (strong, nonatomic) UILabel *titleLabel;
//描述
@property (strong, nonatomic) UILabel *descriptionLabel;
//背景图
@property (strong, nonatomic) UIImageView *backgroundIV;
//时长
@property (strong, nonatomic) UILabel *timeDurationLabel;
//播放数
@property (strong, nonatomic) UILabel *countLabel;
//播放按钮
@property (strong, nonatomic) UIButton *playBtn;
//收藏按钮
@property (strong, nonatomic) UIButton *collectBtn;
//点赞
@property (strong, nonatomic) UIButton *starBtn;
//分享
@property (strong, nonatomic) UIButton *shareBtn;

@property (nonatomic, retain)VideoModel *model;
@end
