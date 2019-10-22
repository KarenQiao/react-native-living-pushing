//
//  UATPusherView.m
//  UATAliLivingPusher
//
//  Created by Mark on 2019/7/5.
//  Copyright © 2019 unionalltech. All rights reserved.
//

#import "UATPusherView.h"
#import <AlivcLibFace/AlivcLibFaceManager.h>
#import <AlivcLibBeauty/AlivcLibBeautyManager.h>

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
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

-(AlivcLivePushConfig*)pusherConfig
{
    if(!_pusherConfig){
        _pusherConfig = [[AlivcLivePushConfig alloc] init];
        _pusherConfig.resolution = AlivcLivePushResolution540P;
        _pusherConfig.beautyOn=true;
        _pusherConfig.beautyMode=AlivcLivePushBeautyModeProfessional;
//        _pusherConfig addWatermarkWithPath:<#(NSString *)#> watermarkCoordX:<#(CGFloat)#> watermarkCoordY:<#(CGFloat)#> watermarkWidth:<#(CGFloat)#>
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
        [_pusher startPreviewAsync:self];
    }
    return _pusher;
}


#pragma mark delegate


#pragma mark -主动触发事件
-(void)startPreview{
    [self.pusher startPreview:self];
}
//添加水印,必须在推流初始化才能设置水印
-(void)addWatermarkWithPath:(NSString*)path x:(float)x y:(float)y width:(float)width;
{
//    [self.pusherConfig addWatermarkWithPath:path watermarkCoordX:x watermarkCoordY:y watermarkWidth:width];
    
    [self.pusher addDynamicWaterMarkImageDataWithPath:path x:x y:y w:width h:0.5];
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
-(void)switchBeautyOn:(BOOL)on;
{
//    [self.pusherConfig setBeautyOn:on];
    RCTLog(@"美颜开关：%d",on);
    [self.pusher setBeautyOn:on?true:false];
}
//设置美白
-(void)setBeautyWhite:(int)white;
{
    [self.pusher setBeautyWhite:white];
}
//设置磨皮
-(void)setBeautyBuffing:(int)buffing;
{
    [self.pusher setBeautyBuffing:buffing];
}
//红润
-(void)setBeautyRuddy:(int)ruddy;
{
    [self.pusher setBeautyRuddy:ruddy];
}
//设置腮红
-(void)setBeautyCheekPink:(int)pink;
{
    [self.pusher setBeautyCheekPink:pink];
}
//设置瘦脸
-(void)setThinFace:(int)face;
{
    [self.pusher setBeautyThinFace:face];
}
//瘦下巴
-(void)setShortenFace:(int)face;
{
    [self.pusher setBeautyShortenFace:face];
}
//大眼
-(void)setBigEye:(int)bigEye;
{
    [self.pusher setBeautyBigEye:bigEye];
}
//切换相机
-(void)switchCameraType;
{
    [self.pusher switchCamera];
//    [self.pusherConfig setCameraType:AlivcLivePushCameraTypeBack];
}
//闪光灯
-(void)flash:(BOOL)flash;
{
    [self.pusher setFlash:flash];
}
//对焦
-(void)setAutoFocus:(BOOL)focus;
{
    [self.pusher setAutoFocus:focus];
}
//手动对焦
-(void)setFocusPointX:(float)x y:(float)y needAuto:(BOOL)needAuto;
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
    if(!self.onPreviewStarted)return ;
    self.onPreviewStarted(@{@"hello":@"world"});
}

/**
 停止预览回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPreviewStoped:(AlivcLivePusher *)pusher;
{
    if(!self.onPreviewStoped)return ;
    self.onPreviewStoped(@{});
}

/**
 渲染第一帧回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onFirstFramePreviewed:(AlivcLivePusher *)pusher;
{
    if(!self.onFirstFramePreviewed)return ;
    self.onFirstFramePreviewed(@{});
}

/**
 推流开始回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushStarted:(AlivcLivePusher *)pusher;
{
    if(!self.onPushStarted)return ;
        self.onPushStarted(@{});
//    self.onPreviewStarted(@{});
}

/**
 推流暂停回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushPaused:(AlivcLivePusher *)pusher;
{
    if(!self.onPushPaused)return ;
        self.onPushPaused(@{});
}

/**
 推流恢复回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushResumed:(AlivcLivePusher *)pusher;
{
    if(!self.onPushResumed)return ;
        self.onPushResumed(@{});
}

/**
 重新推流回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushRestart:(AlivcLivePusher *)pusher;
{
    if(!self.onPushRestart)return;
        self.onPushRestart(@{});
}

/**
 推流停止回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushStoped:(AlivcLivePusher *)pusher;
{
    if(!self.onPushStoped)return ;
        self.onPushStoped(@{});
}
- (void)onCompleted:(AlivcLivePusher *)pusher {
    if(!self.onBGMComplete)return ;
        self.onBGMComplete(@{});
}

- (void)onDownloadTimeout:(AlivcLivePusher *)pusher {
    if(!self.onBGMDownloadTimeout)return;
        self.onBGMDownloadTimeout(@{});
}

- (void)onOpenFailed:(AlivcLivePusher *)pusher {
    if(!self.onBGMOpenFail)return;
        self.onBGMOpenFail(@{});
}

- (void)onPaused:(AlivcLivePusher *)pusher {
    if(!self.onBGMPause)return ;
        self.onBGMPause(@{});
}

- (void)onProgress:(AlivcLivePusher *)pusher progress:(long)progress duration:(long)duration {
    if(!self.onBGMProgress)return ;
        self.onBGMProgress(@{@"progress":@(progress),@"duration":@(duration)});
}

- (void)onResumed:(AlivcLivePusher *)pusher {
    if(!self.onBGMResume)return ;
        self.onBGMResume(@{});
}

- (void)onStarted:(AlivcLivePusher *)pusher {
    if(!self.onBGMStart)return ;
        self.onBGMStart(@{});
}

- (void)onStoped:(AlivcLivePusher *)pusher {
    if(!self.onBGMStop)return ;
        self.onBGMStop(@{});
}

- (void)onSDKError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    if(!self.onSDKError)return ;
        self.onSDKError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onSystemError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    if(!self.onSystemError)return ;
        self.onSystemError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onConnectFail:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    if(!self.onConnectFail)return ;
        self.onConnectFail(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onConnectRecovery:(AlivcLivePusher *)pusher {
    if(!self.onConnectResume)return ;
        self.onConnectResume(@{});
}

- (void)onConnectionLost:(AlivcLivePusher *)pusher {
    if(!self.onConnectLost)return ;
        self.onConnectLost(@{});
}

- (void)onNetworkPoor:(AlivcLivePusher *)pusher {
    if(!self.onNetworkPoor)return ;
        self.onNetworkPoor(@{});
}

- (NSString *)onPushURLAuthenticationOverdue:(AlivcLivePusher *)pusher {
        self.onPushURLAuthenticationOverdue(@{});
    return @"";
}

- (void)onReconnectError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    if(!self.onReconnectError)return ;
        self.onReconnectError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onReconnectStart:(AlivcLivePusher *)pusher {
    if(!self.onReconnectStart)return ;
        self.onReconnectStart(@{});
}

- (void)onReconnectSuccess:(AlivcLivePusher *)pusher {
    if(!self.onReconnectSuccess)return ;
        self.onReconnectSuccess(@{});
}

- (void)onSendDataTimeout:(AlivcLivePusher *)pusher {
    if(!self.onSendDataTimeout)return ;
        self.onSendDataTimeout(@{});
}

- (void)onSendSeiMessage:(AlivcLivePusher *)pusher {
    if(!self.onSendSEIMessage)return ;
        self.onSendSEIMessage(@{});
}

- (void)onSnapshot:(AlivcLivePusher *)pusher image:(UIImage *)image {
    if(!self.onSnapShot)return ;
       self.onSnapShot(@{@"img":image});
}

- (void)onCreate:(AlivcLivePusher *)pusher context:(void *)context {
//        self.onCreateOutBeauty(@{});
    [[AlivcLibBeautyManager shareManager] create:context];
    if(!self.onCreateOutBeauty)return;
    self.onCreateOutBeauty(@{});
}

- (void)onDestory:(AlivcLivePusher *)pusher {
    [[AlivcLibBeautyManager shareManager] destroy];
    if(!self.onDestoryOutBeauty)return ;
        self.onDestoryOutBeauty(@{});
}

//- (int)onProcess:(AlivcLivePusher *)pusher texture:(int)texture textureWidth:(int)width textureHeight:(int)height extra:(long)extra {
//    <#code#>
//}

- (void)switchOn:(AlivcLivePusher *)pusher on:(BOOL)on {
     [[AlivcLibBeautyManager shareManager] switchOn:on];
    if(!self.onBeautySwitchOn)return ;
    self.onBeautySwitchOn(@{@"isOn":@(on)});
}

- (void)updateParam:(AlivcLivePusher *)pusher buffing:(float)buffing whiten:(float)whiten pink:(float)pink cheekpink:(float)cheekpink thinface:(float)thinface shortenface:(float)shortenface bigeye:(float)bigeye {
    [[AlivcLibBeautyManager shareManager] setParam:buffing whiten:whiten pink:pink cheekpink:cheekpink thinface:thinface shortenface:shortenface bigeye:bigeye];
    if(!self.onUpdateParams)return ;
    [self setBeautyBuffing:buffing];
    [self setBeautyWhite:whiten];
    [self setBeautyCheekPink:pink];
    [self setThinFace:thinface];
    [self setShortenFace:shortenface];
    [self setBigEye:bigeye];
    

        self.onUpdateParams(@{@"buffing":@(buffing),
                              @"whiten" :@(whiten),
                              @"pink"   :@(pink),
                              @"cheekpink":@(cheekpink),
                              @"thinface":@(thinface),
                              @"bigeye":@(bigeye),
                              });
}

- (int)onProcess:(AlivcLivePusher *)pusher texture:(int)texture textureWidth:(int)width textureHeight:(int)height extra:(long)extra {
    return [[AlivcLibBeautyManager shareManager] process:texture width:width height:height extra:extra];
    
}




- (void)onCreateDetector:(AlivcLivePusher *)pusher {
    [[AlivcLibFaceManager shareManager] create];
    if(!self.onCreateDetector)return ;
    self.onCreateDetector(@{});
}

- (void)onDestoryDetector:(AlivcLivePusher *)pusher {
    [[AlivcLibFaceManager shareManager] destroy];
    if(!self.onDestoryDetector)return ;
    self.onDestoryDetector(@{});
}

- (long)onDetectorProcess:(AlivcLivePusher *)pusher data:(long)data w:(int)w h:(int)h rotation:(int)rotation format:(int)format extra:(long)extra {
    if(self.onDetectorProcess){
        self.onDetectorProcess(@{@"data":@(data),
                                 @"w":@(w),
                                 @"h":@(h),
                                 @"rotation":@(rotation),
                                 @"format":@(format),
                                 @"extra":@(extra),
                                 });
    }
    return [[AlivcLibFaceManager shareManager] process:data width:w height:h rotation:rotation format:format extra:extra];

    
}

@end
