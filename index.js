import React, { Component } from 'react';
import { ViewStyle,  } from "react-native";
import { requireNativeComponent,NativeModules } from 'react-native';

//用于主动调用事件
export const AliLivingPusher = NativeModules.AliLivingPusher;
//用于UI显示
export const PusherModule    = requireNativeComponent('AliLivingPusher',null);
//异常对象模型
export type AliLivingPusherError = {
    errorCode :Number,//错误码
    errorDescription:String,//错误描述
}
//背景音乐播放进度回调
export type BGMProgressProps = {
    progress:Number,
    duration:Number,
}
//更新了美颜参数
export type BeautyParamUpdateProps = {
    buffing : Number,
    whiten  : Number,
    pink    : Number,
    cheekpink:Number,
    thinface: Number,
    shortenface:Number,
    bigeye  : Number,
}
//检测到人脸处理回调
export type DetectorProps = {
    data:Number,
    w:Number,
    h:Number,
    rotation:Number,
    format:Number,
    extra:Number
}

//美颜开关回调
export type BeautyChangeProps = {
    isOn :Boolean,
}

//本地事件传递必要数据格式
export type NativeProps<T> = {
    nativeEvent:T&{target:Number},
}
//倍率对象
export type ZoomProps = {
    zoom : Number,
}
//异常事件
export type NativeAliLivingPusherErrorProps = NativeProps<AliLivingPusherError>;
//背景音乐播放进度
export type NativeBGMProgressProps = NativeProps<BGMProgressProps>;
//更新美颜
export type NativeUpdateBeautyProps = NativeProps<BeautyParamUpdateProps>;
//检测到人脸处理回调
export type NativeDetectorProps = NativeProps<DetectorProps>;
//美颜开关回调
export type NativeBeautyChangeProps = NativeProps<BeautyChangeProps>;

export type AliPusherProps = {
    onBGMComplete               : ()=>{},
    onBGMDownloadTimeout        : ()=>{},
    onBGMOpenFail               : ()=>{},
    onBGMPause                  : ()=>{},
    onBGMProgress               : (e:NativeBGMProgressProps)=>{},
    onBGMResume                 : ()=>{},
    onBGMStart                  : ()=>{},
    onBGMStop                   : ()=>{},
    onSDKError                  : (e:NativeAliLivingPusherErrorProps)=>{},
    onSystemError               : (e:NativeAliLivingPusherErrorProps)=>{},
    onConnectFail               : (e:NativeAliLivingPusherErrorProps)=>{},
    onConnectResume             : ()=>{},
    onConnectLost               : ()=>{},
    onNetworkPoor               : ()=>{},
    onReconnectError            : (e:NativeAliLivingPusherErrorProps)=>{},
    onReconnectStart            : ()=>{},
    onReconnectSuccess          : ()=>{},
    onSendDataTimeout           : ()=>{},
    onSendSEIMessage            : ()=>{},
    // onSnapShot                  : ()=>{},
    onCreateOutBeauty           : ()=>{},
    onDestoryOutBeauty          : ()=>{},
    onBeautySwitchOn            : (e:NativeBeautyChangeProps)=>{},
    onUpdateParams              : (e:NativeUpdateBeautyProps)=>{},
    onCreateDetector            : ()=>{},
    onDestoryDetector           : ()=>{},
    onDetectorProcess           : ()=>{},
    onPreviewStarted            : ()=>{},
    onPreviewStoped             : ()=>{},
    onFirstFramePreviewed       : ()=>{},
    onPushStarted               : ()=>{},
    onPushPaused                : ()=>{},
    onPushResumed               : ()=>{},
    onPushRestart               : ()=>{},
    onPushStoped                : ()=>{},
    // onPushURLAuthenticationOverdue:()=>{},
}

type Props = {
    style : ViewStyle,
}& AliPusherProps;
type State = {};

export const DEFAULT_PROFILE = {

}
export class Pusher extends Component<Props,State>{

    /**开始预览 */
    static startPreview(){
        AliLivingPusher.startPreview();
    }


    /**获取所有水印信息 */
    static async getAllWatermarks():Promise<String[]>{
        let waterMarks : String[] = await AliLivingPusher.getAllWatermarks();
        return waterMarks ;
    }

    /**开始推流 */
    static startPusher(url:String){
        AliLivingPusher.startPusher(url);
    }

    /**暂停推流 */
    static pausePusher(){
        AliLivingPusher.pausePusher();
    }

    /**恢复推流 */
    static resumePusher(){
        AliLivingPusher.resumePusher();
    }

    /**重新推流 */
    static restartPusher(){
        AliLivingPusher.restartPusher();
    }

    /**开启美颜 */
    static switchBeautyOn(isOn:Boolean){
        AliLivingPusher.switchBeautyOn(isOn);
    }

    /**美白 */
    static setBeautyWhite(white:Number){
        AliLivingPusher.setBeautyWhite(white);
    }

    //磨皮
    static setBeautyBuffing(buffing:Number){
        AliLivingPusher.setBeautyBuffing(buffing);
    }

    //红润
    static setBeautyRuddy(ruddy:Number){
        AliLivingPusher.setBeautyRuddy(ruddy);
    }

    //腮红
    static setCheekPink(cheekpink:Number){
        AliLivingPusher.setCheekPink(cheekpink);
    }

    //瘦脸
    static setThinFace(thinFace:Number){
        AliLivingPusher.setThinFace(thinFace);
    }

    //收下吧
    static setShortenFace(shortenFace:Number){
        AliLivingPusher.setShortenFace(shortenFace);
    }

    //大眼
    static setBigEye(bigEye:Number){
        AliLivingPusher.setBigEye(bigEye);
    }

    //切换q相机
    static switchCameraType(){
        AliLivingPusher.switchCameraType();
    }

    //闪光弹
    static flash(isOn:Boolean){
        AliLivingPusher.flash(isOn);
    }

    //对焦
    static setAutoFocus(isAuto:Boolean){
        AliLivingPusher.setAutoFocus(isAuto);
    }

    //手动对焦
    static setFocusPointX(x:Number,y:Number,needAuto:Boolean){
        AliLivingPusher.setFocusPointX(x,y,needAuto);
    }

    //设置缩放倍数:缩放接口为增量设置，每次设置参数都是在当前基础上做增减，缩放倍数范围（1-3）
    static setZoom(zoom:Number){
        AliLivingPusher.setZoom(zoom);
    }

    //获取缩放倍数:
    static async getZoomResolve():Promise<ZoomProps>{
        let zoom:ZoomProps = await AliLivingPusher.getZoomResolve();
        return zoom;
    }

    //获取最大变焦数
    static async getMaxZoomResolve():Promise<ZoomProps>{
        let maxZoom:ZoomProps = await AliLivingPusher.getMaxZoomResolve();
        return maxZoom;
    }

    //截图-暂时不开放，截图UIImage暂时无法与js交互
    static snapShot(snapShot:Number,duration:Number){
        AliLivingPusher.snapShot(snapShot,duration);
    }


    /**添加水印接口，demo可以动态实现，暂时为测试成功,切勿使用 */
    static addWaterMark(path:String,x:Number,y:Number,w:Number){
        AliLivingPusher.addWatermarkWithPath('',x,y,w,);
    }

    render(){
        return <PusherModule {...this.props}/>
    }

}
