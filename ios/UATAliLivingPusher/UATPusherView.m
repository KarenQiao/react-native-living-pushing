//
//  UATPusherView.m
//  UATAliLivingPusher
//
//  Created by Mark on 2019/7/5.
//  Copyright © 2019 unionalltech. All rights reserved.
//

#import "UATPusherView.h"

@interface UATPusherView()<AlivcLivePusherInfoDelegate,
                            AlivcLivePusherBGMDelegate,
                            AlivcLivePusherErrorDelegate,
                            AlivcLivePusherNetworkDelegate,
                            AlivcLivePusherSnapshotDelegate,
                            AlivcLivePusherCustomFilterDelegate,
                            AlivcLivePusherCustomDetectorDelegate>

@property (nonatomic,strong) AlivcLivePushConfig * pusherConfig ;
@property (nonatomic,strong) AlivcLivePusher     * pusher ;
@property (nonatomic,strong) UIView              * containerView;

@end

@implementation UATPusherView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    self = [super init];
    if(self){
        self.backgroundColor=[UIColor redColor];
    }
    return self;
}

-(AlivcLivePushConfig*)pusherConfig
{
    if(!_pusherConfig){
        _pusherConfig = [[AlivcLivePushConfig alloc] init];
        _pusherConfig.resolution = AlivcLivePushResolution540P;
    }
    return _pusherConfig;
}
-(AlivcLivePusher*)pusher{
    if(!_pusher){
        _pusher = [[AlivcLivePusher alloc] initWithConfig:self.pusherConfig];
        [_pusher setBGMDelegate:self];
        [_pusher setInfoDelegate:self];
        [_pusher setErrorDelegate:self];
        [_pusher setNetworkDelegate:self];
        [_pusher setSnapshotDelegate:self];
        [_pusher setCustomFilterDelegate:self];
        [_pusher setCustomDetectorDelegate:self];
        [_pusher startPreview:self.containerView];
    }
    return _pusher;
}


#pragma mark delegate


#pragma mark -主动触发事件
-(void)startPreview{
    [self.pusher startPreview:self];
}
//添加水印
-(void)addWatermarkWithPath:(NSString*)path x:(float)x y:(float)y width:(float)width;
{
    [self.pusherConfig addWatermarkWithPath:path watermarkCoordX:x watermarkCoordY:y watermarkWidth:width];
}
//去除水印
-(void)removeWatermarkWithPath:(NSString*)path;
{
    [self.pusherConfig removeWatermarkWithPath:path];
}
//开始推流
-(void)startPushWithURL:(NSString*)url;
{
    [self.pusher startPushWithURL:url];
}
//暂停推流
-(void)pause;
{
    [self.pusher pause];
}
//恢复推流
-(void)resume;
{
    [self.pusher resume];
}
//重新开始推流
-(void)restartPush;
{
    [self.pusher restartPush];
}
//美颜开关控制
-(void)switchBeautyOn:(bool)on;
{
    [self.pusherConfig setBeautyOn:on];
}
//设置美白
-(void)setBeautyWhite:(int)white;
{
    [self.pusherConfig setBeautyWhite:white];
}
//设置磨皮
-(void)setBeautyBuffing:(int)buffing;
{
    [self.pusherConfig setBeautyBuffing:buffing];
}
//红润
-(void)setBeautyRuddy:(int)ruddy;
{
    [self.pusherConfig setBeautyRuddy:ruddy];
}
//设置腮红
-(void)setBeautyCheekPink:(int)pink;
{
    [self.pusherConfig setBeautyCheekPink:pink];
}
//设置瘦脸
-(void)setThinFace:(int)face;
{
    [self.pusherConfig setBeautyThinFace:face];
}
//瘦下巴
-(void)setShortenFace:(int)face;
{
    [self.pusherConfig setBeautyShortenFace:face];
}
//大眼
-(void)setBigEye:(int)bigEye;
{
    [self.pusherConfig setBeautyBigEye:bigEye];
}
//切换相机
-(void)switchCameraType;
{
    [self.pusher switchCamera];
}
//闪光灯
-(void)flash:(bool)flash;
{
    [self.pusherConfig setFlash:flash];
}
//对焦
-(void)setAutoFocus:(bool)focus;
{
    [self.pusherConfig setAutoFocus:focus];
}
//手动对焦
-(void)setFocusPointX:(float)x y:(float)y needAuto:(bool)needAuto;
{
    [self.pusher focusCameraAtAdjustedPoint:CGPointMake(x, y) autoFocus:needAuto];
}
//设置缩放倍率
-(void)setZoom:(float)zoom;
{
    [self.pusher setZoom:zoom];
}
//截图
-(void)snapShot:(int)count duration:(int)duration;
{
    [self.pusher snapshot:count interval:duration];
}
//获取最大变焦值
-(float)getMaxZoom;
{
    return [self.pusher getMaxZoom];
}
//获取当前变焦值
-(float)getCurrentZoom;
{
    return [self.pusher getCurrentZoom];
}
//获取所有水印信息
-(NSArray<NSDictionary*>*)getAllWatermarks;
{
    return [self.pusherConfig getAllWatermarks];
}





#pragma mark -事件回调
- (void)onPreviewStarted:(AlivcLivePusher *)pusher;
{
    self.onPreviewStarted(@{});
}

/**
 停止预览回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPreviewStoped:(AlivcLivePusher *)pusher;
{
    self.onPreviewStoped(@{});
}

/**
 渲染第一帧回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onFirstFramePreviewed:(AlivcLivePusher *)pusher;
{
    self.onFirstFramePreviewed(@{});
}

/**
 推流开始回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushStarted:(AlivcLivePusher *)pusher;
{
    //    self.onPushStarted(@{});
}

/**
 推流暂停回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushPaused:(AlivcLivePusher *)pusher;
{
    //    self.onPushPaused(@{});
}

/**
 推流恢复回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushResumed:(AlivcLivePusher *)pusher;
{
    //    self.onPushResumed(@{});
}

/**
 重新推流回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushRestart:(AlivcLivePusher *)pusher;
{
    //    self.onPushRestart(@{});
}

/**
 推流停止回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushStoped:(AlivcLivePusher *)pusher;
{
    //    self.onPushStoped(@{});
}
- (void)onCompleted:(AlivcLivePusher *)pusher {
    //    self.onBGMComplete(@{});
}

- (void)onDownloadTimeout:(AlivcLivePusher *)pusher {
    //    self.onBGMDownloadTimeout(@{});
}

- (void)onOpenFailed:(AlivcLivePusher *)pusher {
    //    self.onBGMOpenFail(@{});
}

- (void)onPaused:(AlivcLivePusher *)pusher {
    //    self.onBGMPause(@{});
}

- (void)onProgress:(AlivcLivePusher *)pusher progress:(long)progress duration:(long)duration {
    //    self.onBGMProgress(@{@"progress":@(progress),@"duration":@(duration)});
}

- (void)onResumed:(AlivcLivePusher *)pusher {
    //    self.onBGMResume(@{});
}

- (void)onStarted:(AlivcLivePusher *)pusher {
    //    self.onBGMStart(@{});
}

- (void)onStoped:(AlivcLivePusher *)pusher {
    //    self.onBGMStop(@{});
}

- (void)onSDKError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    //    self.onSDKError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onSystemError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    //    self.onSystemError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onConnectFail:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    //    self.onConnectFail(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onConnectRecovery:(AlivcLivePusher *)pusher {
    //    self.onConnectResume(@{});
}

- (void)onConnectionLost:(AlivcLivePusher *)pusher {
    //    self.onConnectLost(@{});
}

- (void)onNetworkPoor:(AlivcLivePusher *)pusher {
    //    self.onNetworkPoor(@{});
}

- (NSString *)onPushURLAuthenticationOverdue:(AlivcLivePusher *)pusher {
    //    self.onPushURLAuthenticationOverdue(@{});
    return @"";
}

- (void)onReconnectError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    //    self.onReconnectError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onReconnectStart:(AlivcLivePusher *)pusher {
    //    self.onReconnectStart(@{});
}

- (void)onReconnectSuccess:(AlivcLivePusher *)pusher {
    //    self.onReconnectSuccess(@{});
}

- (void)onSendDataTimeout:(AlivcLivePusher *)pusher {
    //    self.onSendDataTimeout(@{});
}

- (void)onSendSeiMessage:(AlivcLivePusher *)pusher {
    //    self.onSendSEIMessage(@{});
}

- (void)onSnapshot:(AlivcLivePusher *)pusher image:(UIImage *)image {
    //    self.onSnapShot(@{@"img":image});
}

- (void)onCreate:(AlivcLivePusher *)pusher context:(void *)context {
    //    self.onCreateOutBeauty(@{});
}

- (void)onDestory:(AlivcLivePusher *)pusher {
    //    self.onDestoryOutBeauty(@{});
}

//- (int)onProcess:(AlivcLivePusher *)pusher texture:(int)texture textureWidth:(int)width textureHeight:(int)height extra:(long)extra {
//    <#code#>
//}

- (void)switchOn:(AlivcLivePusher *)pusher on:(bool)on {
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //        self.onBeautySwitchOn(@{@"isON":@(on)});
    //    });
    //    self.onBeautySwitchOn(@{@"isON":@(on)});
}

- (void)updateParam:(AlivcLivePusher *)pusher buffing:(float)buffing whiten:(float)whiten pink:(float)pink cheekpink:(float)cheekpink thinface:(float)thinface shortenface:(float)shortenface bigeye:(float)bigeye {
    //    self.onUpdateParams(@{@"buffing":@(buffing),
    //                          @"whiten" :@(whiten),
    //                          @"pink"   :@(pink),
    //                          @"cheekpink":@(cheekpink),
    //                          @"thinface":@(thinface),
    //                          @"bigeye":@(bigeye),
    //                          });
}

- (void)onCreateDetector:(AlivcLivePusher *)pusher {
    //    self.onCreateDetector(@{});
}

- (void)onDestoryDetector:(AlivcLivePusher *)pusher {
    //    self.onDestoryDetector(@{});
}

- (long)onDetectorProcess:(AlivcLivePusher *)pusher data:(long)data w:(int)w h:(int)h rotation:(int)rotation format:(int)format extra:(long)extra {
    //    self.onDetectorProcess(@{@"data":@(data),
    //                             @"w":@(w),
    //                             @"h":@(h),
    //                             @"rotation":@(rotation),
    //                             @"format":@(format),
    //                             @"extra":@(extra),
    //                             });
    return 0;
}





@end
