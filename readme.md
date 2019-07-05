# 阿里云直播SDK-RN版[阿里云直播SDK](https://help.aliyun.com/document_detail/94821.html?spm=a2c4g.11186623.6.850.6adb60926lK3w7)

**注意仅支持IOS8以上，不支持安卓**

## 目录

- [安装](#安装)
- [使用](#使用)
- [API说明](#API说明)

### 安装


```
npm install --save react-native-living-pushing

react-native link react-native-living-pushing
```


1.在项目中info.plist需要设置权限，
```Privacy - Camera Usage Description 、Privacy - Microphone Usage Description```

2.如果需要设置后台直播，则需要开启[后台权限](http://static-aliyun-doc.oss-cn-hangzhou.aliyuncs.com/assets/img/40318/155106684221040_zh-CN.png)

3.[禁止bitcode](http://static-aliyun-doc.oss-cn-hangzhou.aliyuncs.com/assets/img/40318/155106684221041_zh-CN.png)

4.从 ```{project src}/node_modules/react-native-living-pushing/ios/lib ```需要引用aliyun SDK进入项目：General -> Embedded Binaries

    - AlivcLibFace.framework
    - AlivcLibBeauty.framework
    - AliyunPlayerSDK.framework
    - AliyunThirparty.framework
    - AlivcLivePusher.framework
    - AlivcLibRtmp.framework

---

### 使用

    import Pusher from 'react-native-living-pusher'


在渲染函数内容直接使用AliLivingPusher标签，并且设置宽高等样式
   
    <Pusher 
        {其他属性值}
        style={{width:'100%',height:'100%'}}
        />

该组件需要手动出发开始预览、开始推流等事件，直接使用

    Pusher.startPreview();
    Pusher.startPusher('推流目的地址');
    
    


---
### API说明

#### EVENT主动事件说明
|函数名称|参数|函数功能说明|
|-|-|-|
|startPreview()|null|开始推流|
|addWatermarkWithPath(path:String,<br>x:Number,<br>y:Number,<br>width:Number)|path:水印内容;<br>x:距离屏幕左边；<br>y：距离屏幕上方；<br>width：水印宽度|添加水印|
|removeWatermarkWithPath(path:String)|path:需要移除的水印|移除指定水印|
|startPushWithURL(url:String)|url:推流地址|开始推流|
|pause()|null|暂停推流|
|resume()|null|暂停之后可以恢复推流|
|restartPush()|null|重新开始推流|
|switchBeautyOn(on:Boolean)|on:是否开启美颜|打开/关闭美颜|
|setBeautyWhite(white:Number)|white:设置美白|美白级别0-100|
|setBeautyBuffing(buffing:Number)|buffing:设置磨皮|设置磨皮|
|setBeautyRuddy(ruddy:Number)|ruddy:设置红润值|设置红润|
|setBeautyCheekPink(pink:Number)|pink:设置腮红|设置腮红|
|setThinFace(thin:Number)|thin:瘦脸|设置瘦脸|
|setShortenFace(shorten:Number)|shorten:瘦下巴|设置瘦下巴|
|setBigEye(bigEye:Number)|bigEye:设置大眼|设置大眼|
|switchCameraType()|null|切换摄像头|
|flash(isOn:Boolean)|isOn:开/关闪光灯|开启/关闭闪光灯|
|setAutoFocus(isAuto:Boolean)|isAuto:是否自动对焦|设置是否自动对焦|
|setFocusPointX(x:Number,<br>y:Number,<br>needAuto:Boolean)|x:对焦x坐标;<br>y:对焦y坐标;<br>needAuto:对焦完成是否自动对焦|手动设置对焦点|
|setZoom(zoom:Number)|zoom:缩放倍率|设置缩放倍率|
|snapShot(count:Number,duration:Number)|count:;<br>duration:;|截图|
|getMaxZoom():Promise<Number>|return :异步返回最大变焦值|异步获取最大变焦值|
|getCurrentZoom():Promise<Number>|return :异步返回当前变焦值|异步获取当前变焦值|
|getAllWatermarks():Promise<Object[]>|return :异步返回所有水印信息|异步获取所有水印信息|


#### PROPS回调属性说明
|属性值|参数值|触发事件节点|
|-|-|-|
|onBGMComplete|()=>{}|背景音乐播放完毕|
|onBGMDownloadTimeout|()=>{}|背景音乐下载播放超时|
|onBGMOpenFail|()=>{}|背景音乐开启失败|
|onBGMPause|()=>{}|背景音乐暂停播放|
|onBGMProgress|(progress:Number,duration:Number)=>{}|背景音乐播放进度变化|
|onBGMResume|()=>{}|背景音乐恢复播放|
|onBGMStart|()=>{}|背景音乐开始播放|
|onBGMStop|()=>{}|背景音乐停止播放|
|onSDKError|(error:AliLivingPusherError)=>{}|sdk发生异常回调|
|onSystemError|(error:AliLivingPusherError)=>{}|系统发生异常回调|
|onConnectFail|(error:AliLivingPusherError)=>{}|推流连接失败|
|onConnectResume|()=>{}|网络恢复正常|
|onConnectLost|()=>{}|网络被断开|
|onNetworkPoor|()=>{}|网络差回调|
|onPushURLAuthenticationOverdue|():String=>{}<br>return :返回新的推流地址|推流URL的鉴权时长即将过期(将在过期前1min内发送此回调)|
|onReconnectError|(error:AliLivingPusherError)=>{}|重连失败回调|
|onReconnectStart|()=>{}| 重连开始回调|
|onReconnectSuccess|()=>{}| 重连成功回调|
|onSendDataTimeout|()=>{}|发送数据超时|
|onSendSEIMessage|()=>{}|发送SEI Message 通知|
|onSnapShot|(img:React.ReactNode)=>{}|截图|
|onCreateOutBeauty|(context:Object)=>{}|外置美颜滤镜创建回调|
|onDestoryOutBeauty|()=>{}|通知外置滤镜销毁回调|
|onBeautySwitchOn|(isOn:Boolean)=>{}|外置美颜滤镜开关回调|
|onUpdateParams|(buffing:Number,<br>whiten:Number,<br>pink:Number,<br>cheekpink:Number,<br>thinface:Number,<br>shortenface:Number,<br>bigeye:Number)=>{}|外置美颜滤镜更新参数回调|
|onCreateDetector|()=>{}|外置人脸检测创建回调|
|onDestoryDetector|()=>{}|外置人脸检测销毁回调|
|onDetectorProcess|(data:Number,<br>w:Number,<br>h:Number,<br>rotation:Number,<br>format:Number,<br>extra:Number)=>{}|外置人脸检测处理回调|
|onPreviewStarted|()=>{}|开始预览|
|onPreviewStoped|()=>{}|停止预览|
|onFirstFramePreviewed|()=>{}|获取到第一帧|
|onPushStarted|()=>{}|开始推流回调|
|onPushPaused|()=>{}|暂停推流|
|onPushResumed|()=>{}|恢复推流|
|onPushRestart|()=>{}|重新开始推流|
|onPushStoped|()=>{}|停止推流|


#### 错误对象 AliLivingPusherError
|属性名|类型|备注|
|-|-|-|
|errorCode|Number|错误码|
|errorDescription|String|错误描述|






