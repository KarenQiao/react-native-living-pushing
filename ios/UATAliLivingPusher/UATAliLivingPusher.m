//
//  UATAliLivingPusher.m
//  UATAliLivingPusher
//
//  Created by Ting Lin on 2019/6/10.
//  Copyright © 2019 unionalltech. All rights reserved.
//

#import "UATAliLivingPusher.h"
#import <AlivcLivePusher/AlivcLivePusher.h>
#import "UATPusherView.h"
@interface UATAliLivingPusher()
@property (nonatomic,strong) UATPusherView       * containerView;
@end

@implementation UATAliLivingPusher

RCT_EXPORT_MODULE(AliLivingPusher)



-(UATPusherView *)containerView{
    if(!_containerView){
        _containerView = [[UATPusherView alloc] init];
    }
    return _containerView;
}
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
- (UIView*)view
{
    return self.containerView;
}

//RCT_EXPORT_VIEW_PROPERTY(name, NSString)

#pragma mark - 回调事件
//背景音乐完成
RCT_EXPORT_VIEW_PROPERTY(onBGMComplete, RCTBubblingEventBlock)
//背景音乐下载播放超时
RCT_EXPORT_VIEW_PROPERTY(onBGMDownloadTimeout, RCTBubblingEventBlock)
//背景音乐开启失败
RCT_EXPORT_VIEW_PROPERTY(onBGMOpenFail, RCTBubblingEventBlock)
//背景音乐暂停播放
RCT_EXPORT_VIEW_PROPERTY(onBGMPause, RCTBubblingEventBlock)
//背景音乐当前播放进度
RCT_EXPORT_VIEW_PROPERTY(onBGMProgress, RCTBubblingEventBlock)
//背景音乐恢复播放
RCT_EXPORT_VIEW_PROPERTY(onBGMResume, RCTBubblingEventBlock)
//背景音乐开始播放
RCT_EXPORT_VIEW_PROPERTY(onBGMStart, RCTBubblingEventBlock)
//背景音乐停止播放
RCT_EXPORT_VIEW_PROPERTY(onBGMStop, RCTBubblingEventBlock)
//SDK错误回调
RCT_EXPORT_VIEW_PROPERTY(onSDKError, RCTBubblingEventBlock)
//系统错误回调
RCT_EXPORT_VIEW_PROPERTY(onSystemError, RCTBubblingEventBlock)
//推流链接失败
RCT_EXPORT_VIEW_PROPERTY(onConnectFail, RCTBubblingEventBlock)
//网络恢复
RCT_EXPORT_VIEW_PROPERTY(onConnectResume, RCTBubblingEventBlock)
//连接被断开
RCT_EXPORT_VIEW_PROPERTY(onConnectLost, RCTBubblingEventBlock)
//网络差回调
RCT_EXPORT_VIEW_PROPERTY(onNetworkPoor, RCTBubblingEventBlock)
//推流URL的鉴权时长即将过期(将在过期前1min内发送此回调)
RCT_EXPORT_VIEW_PROPERTY(onPushURLAuthenticationOverdue, RCTBubblingEventBlock)
//重连失败回调
RCT_EXPORT_VIEW_PROPERTY(onReconnectError, RCTBubblingEventBlock)
//重连开始回调
RCT_EXPORT_VIEW_PROPERTY(onReconnectStart, RCTBubblingEventBlock)
//重连成功回调
RCT_EXPORT_VIEW_PROPERTY(onReconnectSuccess, RCTBubblingEventBlock)
//发送数据超时
RCT_EXPORT_VIEW_PROPERTY(onSendDataTimeout, RCTBubblingEventBlock)
//发送SEI Message 通知
RCT_EXPORT_VIEW_PROPERTY(onSendSEIMessage, RCTBubblingEventBlock)
//截图
RCT_EXPORT_VIEW_PROPERTY(onSnapShot, RCTBubblingEventBlock)
//外置美颜滤镜创建回调
RCT_EXPORT_VIEW_PROPERTY(onCreateOutBeauty, RCTBubblingEventBlock)
//通知外置滤镜销毁回调
RCT_EXPORT_VIEW_PROPERTY(onDestoryOutBeauty, RCTBubblingEventBlock)
//外置美颜滤镜开关回调
RCT_EXPORT_VIEW_PROPERTY(onBeautySwitchOn, RCTBubblingEventBlock)
//外置美颜滤镜更新参数回调
RCT_EXPORT_VIEW_PROPERTY(onUpdateParams, RCTBubblingEventBlock)

//外置人脸检测创建回调
RCT_EXPORT_VIEW_PROPERTY(onCreateDetector, RCTBubblingEventBlock)
//外置人脸检测销毁回调
RCT_EXPORT_VIEW_PROPERTY(onDestoryDetector, RCTBubblingEventBlock)
//外置人脸检测处理回调
RCT_EXPORT_VIEW_PROPERTY(onDetectorProcess, RCTBubblingEventBlock)
//开始预览
RCT_EXPORT_VIEW_PROPERTY(onPreviewStarted, RCTBubblingEventBlock)
//停止预览
RCT_EXPORT_VIEW_PROPERTY(onPreviewStoped, RCTBubblingEventBlock)
//获取到第一帧
RCT_EXPORT_VIEW_PROPERTY(onFirstFramePreviewed, RCTBubblingEventBlock)
//开始推流回调
RCT_EXPORT_VIEW_PROPERTY(onPushStarted, RCTBubblingEventBlock)
//暂停推流
RCT_EXPORT_VIEW_PROPERTY(onPushPaused, RCTBubblingEventBlock)
//恢复推流
RCT_EXPORT_VIEW_PROPERTY(onPushResumed, RCTBubblingEventBlock)
//重新开始推流
RCT_EXPORT_VIEW_PROPERTY(onPushRestart, RCTBubblingEventBlock)
//停止推流
RCT_EXPORT_VIEW_PROPERTY(onPushStoped, RCTBubblingEventBlock)





#pragma mark 主动事件

//开始预览
RCT_EXPORT_METHOD(startPreview){
    [self.containerView startPreview];
}
//添加水印接口;SDK提供了添加水印功能，并且最多支持添加多个水印，水印图片必须为png格式图片，目前最多支持3个水印
RCT_EXPORT_METHOD(addWatermarkWithPath:(NSString*)path x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width){
    NSString * iconPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"iconfont"] ofType:@"png"];
//    iconPath = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562562507124&di=31e143e9a7ac8dfd5755b5d75941ee5f&imgtype=0&src=http%3A%2F%2Ft0.qlogo.cn%2Fmbloghead%2F93d07d6c269779f9f516%2F180";
    [self.containerView addWatermarkWithPath:iconPath x:x y:y width:width];
}
//去除水印
RCT_EXPORT_METHOD(removeWatermarkWithPath:(NSString*)path){
    NSString * iconPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"iconfont"] ofType:@"png"];
    [self.containerView removeWatermarkWithPath:iconPath];
}
//获取所有水印信息
RCT_EXPORT_METHOD(getAllWatermarks:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    NSArray<NSDictionary*>*marks= [self.containerView getAllWatermarks];
    if(marks){
        resolve(marks);
    }else{
        reject(@"0",@"获取水印信息失败",[[NSError alloc] init]);
    }
}
//开始推流
RCT_EXPORT_METHOD(startPusher:(NSString*)url){
    [self.containerView startPushWithURL:url];
}
//暂停推流
RCT_EXPORT_METHOD(pausePusher){
    [self.containerView pause];
}
//恢复推流
RCT_EXPORT_METHOD(resumePusher){
    [self.containerView resume];
}
//重新推流
RCT_EXPORT_METHOD(restartPusher){
    [self.containerView restartPush];
}
//开启美颜
RCT_EXPORT_METHOD(switchBeautyOn:(BOOL)on){
    [self.containerView switchBeautyOn:on];
}
//美白
RCT_EXPORT_METHOD(setBeautyWhite:(int)white){
    [self.containerView setBeautyWhite:white];
}
//磨皮
RCT_EXPORT_METHOD(setBeautyBuffing:(int)buffing){
    [self.containerView setBeautyBuffing:buffing];
}
//红润
RCT_EXPORT_METHOD(setBeautyRuddy:(int)ruddy){
    [self.containerView setBeautyRuddy:ruddy];
}
//腮红
RCT_EXPORT_METHOD(setCheekPink:(int)pink){
    [self.containerView setBeautyCheekPink:pink];
}
//瘦脸
RCT_EXPORT_METHOD(setThinFace:(int)face){
    [self.containerView setThinFace:face];
}
//收下吧
RCT_EXPORT_METHOD(setShortenFace:(int)face){
    [self.containerView setShortenFace:face];
}
//大眼
RCT_EXPORT_METHOD(setBigEye:(int)bigEye){
    [self.containerView setBigEye:bigEye];
}
//切换q相机
RCT_EXPORT_METHOD(switchCameraType){
    [self.containerView switchCameraType];
}
//闪光弹
RCT_EXPORT_METHOD(flash:(BOOL)flash){
    [self.containerView flash:flash];
}
//对焦
RCT_EXPORT_METHOD(setAutoFocus:(BOOL)focus){
    [self.containerView setAutoFocus:focus];
}
//手动对焦
RCT_EXPORT_METHOD(setFocusPointX:(float)x y:(float)y needAuto:(BOOL)needAuto){
//    [self.pusher focusCameraAtAdjustedPoint:CGPointMake(x, y) autoFocus:needAuto];
    [self.containerView setFocusPointX:x y:y needAuto:needAuto];
}
//设置缩放倍数
RCT_EXPORT_METHOD(setZoom:(float)zoom){
    [self.containerView setZoom:zoom];
}
//获取缩放倍数
RCT_EXPORT_METHOD(getZoomResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    float zoom = [self.containerView getCurrentZoom];
    resolve(@{@"zoom":@(zoom)});
}
//获取最大变焦数
RCT_EXPORT_METHOD(getMaxZoomResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    float maxZoom = [self.containerView getMaxZoom];
    resolve(@{@"zoom":@(maxZoom)});
    
}
//截图
RCT_EXPORT_METHOD(snapShot:(int)count duration:(int)duration){
    [self.containerView snapShot:count duration:duration];
}


@end
