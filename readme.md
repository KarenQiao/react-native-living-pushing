# 封装使用[阿里云直播SDK](https://help.aliyun.com/document_detail/94821.html?spm=a2c4g.11186623.6.850.6adb60926lK3w7)

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

---
### API说明

