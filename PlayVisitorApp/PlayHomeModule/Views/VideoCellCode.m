//
//  VideoCellCode.m
//  PlayVisitorAPP
//
//  Created by BlackChen on 16/3/24.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import "VideoCellCode.h"

@implementation VideoCellCode


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addContentView];
    }
    return self;
}

- (void)addContentView{
    //标题
    _titleLabel = [[UILabel alloc]initWithFrame:AdaptCGRectMake(10, 5, 150, 15)];
    _titleLabel.text = _model.title;
    [self addSubview:_titleLabel];
    //收藏按钮
    _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _collectBtn.frame = AdaptCGRectMake(320 - 50, 2, 40, 16);
    [self addSubview:_collectBtn];
    //描述
    _descriptionLabel = [[UILabel alloc]initWithFrame:AdaptCGRectMake(10, 20, 300, 20)];
    [self addSubview:_descriptionLabel];
    //背景图
    _backgroundIV = [[UIImageView alloc]initWithFrame:AdaptCGRectMake(10, 40, 300, 110)];
    [self addSubview:_backgroundIV];
    //时长
    _timeDurationLabel = [[UILabel alloc]initWithFrame:AdaptCGRectMake(10, 150, 50, 15)];
    [self addSubview:_timeDurationLabel];
    //播放数
    _countLabel = [[UILabel alloc]initWithFrame:AdaptCGRectMake(60, 150, 50, 15)];
    [self addSubview:_countLabel];
    //播放按钮
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _playBtn.frame = AdaptCGRectMake(0, 0, 50, 50);
    _playBtn.center = _backgroundIV.center;
    [self addSubview:_playBtn];
    //点赞
    _starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _starBtn.frame = AdaptCGRectMake(320-120 , 150, 50, 15);
    [self addSubview:_starBtn];
    //分享
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _shareBtn.frame = AdaptCGRectMake(320-60 , 150, 50, 15);
    [self addSubview:_shareBtn];

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setModel:(VideoModel *)model{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.titleLabel.text = model.title;
    self.descriptionLabel.text = model.descriptionDe;
    [self.backgroundIV sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"logo"]];
    self.countLabel.text = [NSString stringWithFormat:@"%ld.%ld万",model.playCount/10000,model.playCount/1000-model.playCount/10000];
    self.timeDurationLabel.text = [model.ptime substringWithRange:NSMakeRange(12, 4)];
}

@end
