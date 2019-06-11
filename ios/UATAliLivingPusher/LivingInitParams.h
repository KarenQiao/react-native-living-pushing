//
//  LivingInitParams.h
//  UATAliLivingPusher
//
//  Created by Ting Lin on 2019/6/11.
//  Copyright © 2019 unionalltech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AlivcLivePusher/AlivcLivePusher.h>
NS_ASSUME_NONNULL_BEGIN

@interface LivingInitParams : NSObject
//推流分辨率 540P
@property (nonatomic,assign) AlivcLivePushResolution resolution;
//推流码率控制模式
@property (nonatomic,assign) AlivcLivePushQualityMode qualityMode;
//是否开启码率自适应模式
@property (nonatomic,assign) Boolean enableAutoBitrate;
//是否开启动态分辨率模式
@property (nonatomic,assign) Boolean enableAutoResolution;
//视频帧率
@property (nonatomic,assign) AlivcLivePushFPS fps;
//最小视频帧率
@property (nonatomic,assign) AlivcLivePushFPS minFps;
//目标视频编码码率
@property (nonatomic,assign) int targetVideoBitrate;
//最小视频编码码率
@property (nonatomic,assign) 
//初始视频编码码率
@property (nonatomic,assign)
//音频编码码率
@property (nonatomic,assign)
//音频采样率
@property (nonatomic,assign)
//音频声道数
@property (nonatomic,assign)
//视频GOP大小
@property (nonatomic,assign)
//推流断开自动重连次数
@property (nonatomic,assign)
//推流断开自动重连间隔
@property (nonatomic,assign)
//发送网络数据超时时间
@property (nonatomic,assign)
//横竖屏设定
@property (nonatomic,assign)
//相机位置
@property (nonatomic,assign)
//是否推流镜像
@property (nonatomic,assign)
//是否预览镜像
@property (nonatomic,assign)
//是否纯音频推流
@property (nonatomic,assign)
//是否纯视频推流
@property (nonatomic,assign)
//相机是否自动对焦
@property (nonatomic,assign)
//是否打开美颜
@property (nonatomic,assign)
//暂停退后台图片
@property (nonatomic,assign)
//弱网图片
@property (nonatomic,assign)
//美颜模式
@property (nonatomic,assign)
//美白参数
@property (nonatomic,assign)
//磨皮参数
@property (nonatomic,assign)
//红润参数
@property (nonatomic,assign)
//腮红参数
@property (nonatomic,assign)
//瘦脸参数
@property (nonatomic,assign)
//收下巴参数
@property (nonatomic,assign)
//大眼参数
@property (nonatomic,assign)
//是否打开手电筒
@property (nonatomic,assign)
//视频编码器
@property (nonatomic,assign)
//音频编码器
@property (nonatomic,assign)
//自定义外部主流开关
@property (nonatomic,assign)
//自定义外部视频数据格式
@property (nonatomic,assign)
//自定义外部音频数据格式
@property (nonatomic,assign)
//预览窗口显示模式
@property (nonatomic,assign)
//添加水印接口
//移除水印接口
//获取所有水印信息
//获取推流分辨率

@end

NS_ASSUME_NONNULL_END
