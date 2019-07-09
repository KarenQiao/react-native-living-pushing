//
//  UATPusherView.h
//  UATAliLivingPusher
//
//  Created by Mark on 2019/7/5.
//  Copyright © 2019 unionalltech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTViewManager.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTComponent.h>
#import <AlivcLivePusher/AlivcLivePusher.h>

NS_ASSUME_NONNULL_BEGIN

@interface UATPusherView : UIView


//开始预览
-(void)startPreview;
//添加水印
-(void)addWatermarkWithPath:(NSString*)path x:(float)x y:(float)y width:(float)width;
//去除水印
-(void)removeWatermarkWithPath:(NSString*)path;
//开始推流
-(void)startPushWithURL:(NSString*)url;
//暂停推流
-(void)pause;
//恢复推流
-(void)resume;
//重新开始推流
-(void)restartPush;
//美颜开关控制
-(void)switchBeautyOn:(BOOL)on;
//设置美白
-(void)setBeautyWhite:(int)white;
//设置磨皮
-(void)setBeautyBuffing:(int)buffing;
//红润
-(void)setBeautyRuddy:(int)ruddy;
//设置腮红
-(void)setBeautyCheekPink:(int)pink;
//设置瘦脸
-(void)setThinFace:(int)face;
//瘦下巴
-(void)setShortenFace:(int)face;
//大眼
-(void)setBigEye:(int)bigEye;
//切换相机
-(void)switchCameraType;
//闪光灯
-(void)flash:(BOOL)flash;
//对焦
-(void)setAutoFocus:(BOOL)focus;
//手动对焦
-(void)setFocusPointX:(float)x y:(float)y needAuto:(BOOL)needAuto;
//设置缩放倍率
-(void)setZoom:(float)zoom;
//截图
-(void)snapShot:(int)count duration:(int)duration;
//获取最大变焦值
-(float)getMaxZoom;
//获取当前变焦值
-(float)getCurrentZoom;
//获取所有水印信息
-(NSArray<NSDictionary*>*)getAllWatermarks;


//背景音乐完成
@property (nonatomic,copy) RCTBubblingEventBlock onBGMComplete;
//背景音乐下载播放超时
@property (nonatomic,copy) RCTBubblingEventBlock onBGMDownloadTimeout;
//背景音乐开启失败
@property (nonatomic,copy) RCTBubblingEventBlock onBGMOpenFail;
//背景音乐暂停播放
@property (nonatomic,copy) RCTBubblingEventBlock onBGMPause;
//背景音乐当前播放进度
@property (nonatomic,copy) RCTBubblingEventBlock onBGMProgress;
//背景音乐恢复播放
@property (nonatomic,copy) RCTBubblingEventBlock onBGMResume;
//背景音乐开始播放
@property (nonatomic,copy) RCTBubblingEventBlock onBGMStart;
//背景音乐停止播放
@property (nonatomic,copy) RCTBubblingEventBlock onBGMStop;
//SDK错误回调
@property (nonatomic,copy) RCTBubblingEventBlock onSDKError;
//系统错误回调
@property (nonatomic,copy) RCTBubblingEventBlock onSystemError;
//推流链接失败
@property (nonatomic,copy) RCTBubblingEventBlock onConnectFail;
//网络恢复
@property (nonatomic,copy) RCTBubblingEventBlock onConnectResume;
//连接被断开
@property (nonatomic,copy) RCTBubblingEventBlock onConnectLost;
//网络差回调
@property (nonatomic,copy) RCTBubblingEventBlock onNetworkPoor;
//推流URL的鉴权时长即将过期(将在过期前1min内发送此回调)
@property (nonatomic,copy) RCTBubblingEventBlock onPushURLAuthenticationOverdue;
//重连失败回调
@property (nonatomic,copy) RCTBubblingEventBlock onReconnectError;
//重连开始回调
@property (nonatomic,copy) RCTBubblingEventBlock onReconnectStart;
//重连成功回调
@property (nonatomic,copy) RCTBubblingEventBlock onReconnectSuccess;
//发送数据超时
@property (nonatomic,copy) RCTBubblingEventBlock onSendDataTimeout;
//发送SEI Message 通知
@property (nonatomic,copy) RCTBubblingEventBlock onSendSEIMessage;
//截图
@property (nonatomic,copy) RCTBubblingEventBlock onSnapShot;
//外置美颜滤镜创建回调
@property (nonatomic,copy) RCTBubblingEventBlock onCreateOutBeauty;
//通知外置滤镜销毁回调
@property (nonatomic,copy) RCTBubblingEventBlock onDestoryOutBeauty;
//外置美颜滤镜开关回调
@property (nonatomic,copy) RCTBubblingEventBlock onBeautySwitchOn;
//外置美颜滤镜更新参数回调
@property (nonatomic,copy) RCTBubblingEventBlock onUpdateParams;
//外置人脸检测创建回调
@property (nonatomic,copy) RCTBubblingEventBlock onCreateDetector;
//外置人脸检测销毁回调
@property (nonatomic,copy) RCTBubblingEventBlock onDestoryDetector;
//外置人脸检测处理回调
@property (nonatomic,copy) RCTBubblingEventBlock onDetectorProcess;
//开始预览
@property (nonatomic,copy) RCTBubblingEventBlock onPreviewStarted;
//停止预览
@property (nonatomic,copy) RCTBubblingEventBlock onPreviewStoped;
//获取到第一帧
@property (nonatomic,copy) RCTBubblingEventBlock onFirstFramePreviewed;
//开始回调
@property (nonatomic,copy) RCTBubblingEventBlock onPushStarted;
//暂停推流
@property (nonatomic,copy) RCTBubblingEventBlock onPushPaused;
//恢复推流
@property (nonatomic,copy) RCTBubblingEventBlock onPushResumed;
//重新开始推流
@property (nonatomic,copy) RCTBubblingEventBlock onPushRestart;
//停止推流
@property (nonatomic,copy) RCTBubblingEventBlock onPushStoped;






@end

NS_ASSUME_NONNULL_END
