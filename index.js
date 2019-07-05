import React, { Component } from 'react';
import { ViewStyle,  } from "react-native";
import { requireNativeComponent,NativeModules } from 'react-native';

//用于主动调用事件
export const AliLivingPusher = NativeModules.AliLivingPusher;
//用于UI显示
export const PusherModule    = requireNativeComponent('AliLivingPusher',null);


type Props = {
    style : ViewStyle,
};
type State = {};

export class Pusher extends Component<Props,State>{

    /**开始预览 */
    static startPreview(){
        AliLivingPusher.startPreview();
    }

    /**添加水印接口 */
    static addWatermarkWithPath(path:String,x:Number,y:Number,width:Number){
        AliLivingPusher.addWatermarkWithPath(path,x,y,width);
    }

    /**去除水印 */
    static removeWatermarkWithPath(path:String){
        AliLivingPusher.removeWatermarkWithPath(path);
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

    //设置缩放倍数
    static setZoom(zoom:Number){
        AliLivingPusher.setZoom(zoom);
    }

    //获取缩放倍数
    static async getZoomResolve():Promise<Number>{
        let zoom:Number = await AliLivingPusher.getZoomResolve();
        return zoom;
    }

    //获取最大变焦数
    static async getMaxZoomResolve():Promise<Number>{
        let maxZoom:Number = await AliLivingPusher.getMaxZoomResolve();
        return maxZoom;
    }

    //截图
    static snapShot(snapShot:Number,duration:Number){
        AliLivingPusher.snapShot(snapShot,duration);
    }


    render(){
        return <PusherModule {...this.props}/>
    }

}
