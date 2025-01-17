
/*!
 @header VideoModel.h
 
 @abstract  作者Github地址：https://github.com/zhengwenming
            作者CSDN博客地址:http://blog.csdn.net/wenmingzheng
 
 @author   Created by zhengwenming on  16/1/20
 
 @version 1.00 16/1/20 Creation(版本信息)
 
   Copyright © 2016年 郑文明. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject
//图片
@property (nonatomic, strong) NSString * cover;
//简介
@property (nonatomic, strong) NSString * descriptionDe;
@property (nonatomic, assign) NSInteger  length;
@property (nonatomic, strong) NSString * m3u8_url;
@property (nonatomic, strong) NSString * m3u8Hd_url;
@property (nonatomic, strong) NSString * mp4_url;
@property (nonatomic, strong) NSString * mp4_Hd_url;
//播放量
@property (nonatomic, assign) NSInteger  playCount;
@property (nonatomic, strong) NSString * playersize;
//播放时间
@property (nonatomic, strong) NSString * ptime;
@property (nonatomic, strong) NSString * replyBoard;
@property (nonatomic, strong) NSString * replyCount;
@property (nonatomic, strong) NSString * replyid;
//标题
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * vid;
@property (nonatomic, strong) NSString * videosource;

@property (nonatomic, assign) NSUInteger heartCount;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com