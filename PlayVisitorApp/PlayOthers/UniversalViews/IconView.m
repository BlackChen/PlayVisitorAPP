//
//  IconView.m
//  PlayVisitorAPP
//
//  Created by BlackChen on 16/3/18.
//  Copyright © 2016年 BlackChen. All rights reserved.
//

#import "IconView.h"

#define Width self.frame.size.width
#define Height self.frame.size.height

@implementation IconView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setcontenView];
    }
    return self;
}

- (void)setcontenView{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, Width)];
    self.imageView.layer.cornerRadius = Width/2;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.imageView];
    
    if (Height - Width > 10) {
        self.iconLable = [[UILabel alloc]initWithFrame:CGRectMake(0, Width, Width, Height-Width)];
        self.iconLable.textAlignment = NSTextAlignmentCenter;
        self.iconLable.font = [UIFont systemFontOfSize:15];
        self.iconLable.textColor = [UIColor purpleColor];
        [self addSubview:self.iconLable];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
