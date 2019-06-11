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
RCT_EXPORT_METHOD(startPreview){
    [self.pusher startPreview:self.containerView];
}
@end
