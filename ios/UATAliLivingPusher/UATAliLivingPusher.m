//
//  UATAliLivingPusher.m
//  UATAliLivingPusher
//
//  Created by Ting Lin on 2019/6/10.
//  Copyright © 2019 unionalltech. All rights reserved.
//

#import "UATAliLivingPusher.h"
#import <AlivcLivePusher/AlivcLivePusher.h>

@interface UATAliLivingPusher()<AlivcLivePusherInfoDelegate,
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

@implementation UATAliLivingPusher

RCT_EXPORT_MODULE(AliLivingPusher)

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
-(UIView *)containerView{
    if(!_containerView){
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor redColor];
    }
    return _containerView;
}
- (UIView*)view
{
    return self.containerView;
}



#pragma mark event
//开始预览
RCT_EXPORT_METHOD(startPreview){
    RCTLog(@"\n\n=========click start pre");
    [self.pusher startPreview:self.containerView];
}
//添加水印接口
RCT_EXPORT_METHOD(addWatermarkWithPath:(NSString*)path x:(float)x y:(float)y width:(float)width){
    [self.pusherConfig addWatermarkWithPath:path watermarkCoordX:x watermarkCoordY:y watermarkWidth:width];
}
//去除水印
RCT_EXPORT_METHOD(removeWatermarkWithPath:(NSString*)path){
    [self.pusherConfig removeWatermarkWithPath:path];
}
//获取所有水印信息
RCT_EXPORT_METHOD(getAllWatermarks:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    NSArray<NSDictionary*>*marks= [self.pusherConfig getAllWatermarks];
    if(marks){
        resolve(marks);
    }else{
        reject(@"0",@"获取水印信息失败",[[NSError alloc] init]);
    }
}
//开始推流
RCT_EXPORT_METHOD(startPusher:(NSString*)url){
    [self.pusher startPushWithURL:url];
}
//暂停推流
RCT_EXPORT_METHOD(pausePusher){
    [self.pusher pause];
}
//恢复推流
RCT_EXPORT_METHOD(resumePusher){
    [self.pusher resume];
}
//重新推流
RCT_EXPORT_METHOD(restartPusher){
    [self.pusher restartPush];
}
//开启美颜
RCT_EXPORT_METHOD(switchBeautyOn:(bool)on){
    [self.pusherConfig setBeautyOn:on];
}
//美白
RCT_EXPORT_METHOD(setBeautyWhite:(int)white){
    [self.pusherConfig setBeautyWhite:white];
}
//磨皮
RCT_EXPORT_METHOD(setBeautyBuffing:(int)buffing){
    [self.pusherConfig setBeautyBuffing:buffing];
}
//红润
RCT_EXPORT_METHOD(setBeautyRuddy:(int)ruddy){
    [self.pusherConfig setBeautyRuddy:ruddy];
}
//腮红
RCT_EXPORT_METHOD(setCheekPink:(int)pink){
    [self.pusherConfig setBeautyCheekPink:pink];
}
//瘦脸
RCT_EXPORT_METHOD(setThinFace:(int)face){
    [self.pusherConfig setBeautyThinFace:face];
}
//收下吧
RCT_EXPORT_METHOD(setShortenFace:(int)face){
    [self.pusherConfig setBeautyShortenFace:face];
}
//大眼
RCT_EXPORT_METHOD(setBigEye:(int)bigEye){
    [self.pusherConfig setBeautyBigEye:bigEye];
}
//切换q相机
RCT_EXPORT_METHOD(switchCameraType){
    [self.pusher switchCamera];
}
//闪光弹
RCT_EXPORT_METHOD(flash:(bool)flash){
    [self.pusher setFlash:flash];
}
//对焦
RCT_EXPORT_METHOD(setAutoFocus:(bool)focus){
    [self.pusher setAutoFocus:focus];
}
//手动对焦
RCT_EXPORT_METHOD(setFocusPointX:(float)x y:(float)y needAuto:(bool)needAuto){
    [self.pusher focusCameraAtAdjustedPoint:CGPointMake(x, y) autoFocus:needAuto];
}
//设置缩放倍数
RCT_EXPORT_METHOD(setZoom:(float)zoom){
    [self.pusher setZoom:zoom];
}
//获取缩放倍数
RCT_EXPORT_METHOD(getZoomResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    float zoom = [self.pusher getCurrentZoom];
    resolve(@{@"zoom":@(zoom)});
}
//获取最大变焦数
RCT_EXPORT_METHOD(getMaxZoomResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    float maxZoom = [self.pusher getMaxZoom];
    resolve(@{@"maxZoom":@(maxZoom)});
}
//截图
RCT_EXPORT_METHOD(snapShot:(int)count duration:(int)duration){
    [self.pusher snapshot:count interval:duration];
}
//

#pragma mark delegate
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
    self.onPushStarted(@{});
}

/**
 推流暂停回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushPaused:(AlivcLivePusher *)pusher;
{
    self.onPushPaused(@{});
}

/**
 推流恢复回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushResumed:(AlivcLivePusher *)pusher;
{
    self.onPushResumed(@{});
}

/**
 重新推流回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushRestart:(AlivcLivePusher *)pusher;
{
    self.onPushRestart(@{});
}

/**
 推流停止回调
 
 @param pusher 推流AlivcLivePusher
 */
- (void)onPushStoped:(AlivcLivePusher *)pusher;
{
    self.onPushStoped(@{});
}
- (void)onCompleted:(AlivcLivePusher *)pusher {
    self.onBGMComplete(@{});
}

- (void)onDownloadTimeout:(AlivcLivePusher *)pusher {
    self.onBGMDownloadTimeout(@{});
}

- (void)onOpenFailed:(AlivcLivePusher *)pusher {
    self.onBGMOpenFail(@{});
}

- (void)onPaused:(AlivcLivePusher *)pusher {
    self.onBGMPause(@{});
}

- (void)onProgress:(AlivcLivePusher *)pusher progress:(long)progress duration:(long)duration {
    self.onBGMProgress(@{@"progress":@(progress),@"duration":@(duration)});
}

- (void)onResumed:(AlivcLivePusher *)pusher {
    self.onBGMResume(@{});
}

- (void)onStarted:(AlivcLivePusher *)pusher {
    self.onBGMStart(@{});
}

- (void)onStoped:(AlivcLivePusher *)pusher {
    self.onBGMStop(@{});
}

- (void)onSDKError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    self.onSDKError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onSystemError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    self.onSystemError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onConnectFail:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    self.onConnectFail(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onConnectRecovery:(AlivcLivePusher *)pusher {
    self.onConnectResume(@{});
}

- (void)onConnectionLost:(AlivcLivePusher *)pusher {
    self.onConnectLost(@{});
}

- (void)onNetworkPoor:(AlivcLivePusher *)pusher {
    self.onNetworkPoor(@{});
}

- (NSString *)onPushURLAuthenticationOverdue:(AlivcLivePusher *)pusher {
    self.onPushURLAuthenticationOverdue(@{});
    return @"";
}

- (void)onReconnectError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error {
    self.onReconnectError(@{@"code":@(error.errorCode),@"desc":error.errorDescription});
}

- (void)onReconnectStart:(AlivcLivePusher *)pusher {
    self.onReconnectStart(@{});
}

- (void)onReconnectSuccess:(AlivcLivePusher *)pusher {
    self.onReconnectSuccess(@{});
}

- (void)onSendDataTimeout:(AlivcLivePusher *)pusher {
    self.onSendDataTimeout(@{});
}

- (void)onSendSeiMessage:(AlivcLivePusher *)pusher {
    self.onSendSEIMessage(@{});
}

- (void)onSnapshot:(AlivcLivePusher *)pusher image:(UIImage *)image {
    self.onSnapShot(@{@"img":image});
}

- (void)onCreate:(AlivcLivePusher *)pusher context:(void *)context {
    self.onCreateOutBeauty(@{});
}

- (void)onDestory:(AlivcLivePusher *)pusher {
    self.onDestoryOutBeauty(@{});
}

//- (int)onProcess:(AlivcLivePusher *)pusher texture:(int)texture textureWidth:(int)width textureHeight:(int)height extra:(long)extra {
//    <#code#>
//}

- (void)switchOn:(AlivcLivePusher *)pusher on:(bool)on {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.onBeautySwitchOn(@{@"isON":@(on)});
//    });
    self.onBeautySwitchOn(@{@"isON":@(on)});
}

- (void)updateParam:(AlivcLivePusher *)pusher buffing:(float)buffing whiten:(float)whiten pink:(float)pink cheekpink:(float)cheekpink thinface:(float)thinface shortenface:(float)shortenface bigeye:(float)bigeye {
    self.onUpdateParams(@{@"buffing":@(buffing),
                          @"whiten" :@(whiten),
                          @"pink"   :@(pink),
                          @"cheekpink":@(cheekpink),
                          @"thinface":@(thinface),
                          @"bigeye":@(bigeye),
                          });
}

- (void)onCreateDetector:(AlivcLivePusher *)pusher {
    self.onCreateDetector(@{});
}

- (void)onDestoryDetector:(AlivcLivePusher *)pusher {
    self.onDestoryDetector(@{});
}

- (long)onDetectorProcess:(AlivcLivePusher *)pusher data:(long)data w:(int)w h:(int)h rotation:(int)rotation format:(int)format extra:(long)extra {
    self.onDetectorProcess(@{@"data":@(data),
                             @"w":@(w),
                             @"h":@(h),
                             @"rotation":@(rotation),
                             @"format":@(format),
                             @"extra":@(extra),
                             });
    return 0;
}

@end
