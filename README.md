# Boring Flutter Music App

一个基于Flutter的音乐播放器。

## Introduction

The usual Media architecture for a native Android music Player application is:
UI + Media Controller + Media Session + Player.
However, there is currently no similar architecture or media player like ExoPlayer in Flutter.
Therefore, this project adopts the architecture of Flutter UI + Assets_Audio_Player Plugin (a third-party music player).
This may be restrictive, but expect a better solution from the Flutter team in the future.
At the same time, I tried to implement my own music player in another Native Kotlin Android music player project.

All the music used in the project are from https://www.freemusicarchive.org/


通常在一个原生安卓音乐播放程序的媒体架构为：
UI + Media Controller + Media Session + Player。
然而，目前在Flutter中并没有类似的架构系统和类似ExoPlayer之类的媒体播放器，
所以本项目采用了Flutter UI + assets_audio_player plugin(一个第三方音乐播放器)的架构。
这可能会带来很多限制，但是期待官方未来会做出更好的解决方案。
同时我也尝试在另一个Native Koltin Android的音乐播放器程序中实现自己的音乐播放器。

另：项目中使用的所有音乐均来自https://www.freemusicarchive.org/

## important

if we use Flutter in China's Mainland, we would need some help.

如果在中国大陆地区使用Flutter需要为其配置镜像，更多帮助请参考：

- [Use Flutter in China](https://flutter.cn/community/china)
- [Flutter China Community](https://flutter.cn/)

## References

Flutter CodeLabs: https://flutter.dev/docs/codelabs

Flutter Cookbook: https://flutter.dev/docs/cookbook

Flutter Samples from Google: https://flutter.github.io/samples/#

itsallwidgets - A open list of App built with Flutter: https://itsallwidgets.com/

assets_audio_player plugin: https://pub.dev/packages/assets_audio_player

Material Desgin: https://material.io/design

Sketch: https://www.sketch.com/

## Slected Videos & Articles

### Online Module:

- [AppBrewery's Online module from Angela Yu](https://www.udemy.com/course/flutter-bootcamp-with-dart/?referralCode=2B7724A180C0502A2547)

### Bilibili Videos:

Flutter Performance (The language is Chinese but we could use English subtitles):
- [Flutter的性能测试和理论 - Flutter团队](https://www.bilibili.com/video/av63626119)
- [深入了解Flutter的高性能图形渲染 - Flutter团队](https://www.bilibili.com/video/av48772383)

### Youtube Videos:

Introduction:
- [How is Flutter different for app development(Flutter in Focus) - Flutter Team](https://www.youtube.com/watch?v=l-YO9CmaSUM&list=PLKULprLUqWYfRh72fsrRtvNHjyHKrUA4N&index=22)
- [Flutter vs Native Android / iOS](https://www.youtube.com/watch?v=xEA9vw8t4Ho&list=PLKULprLUqWYfRh72fsrRtvNHjyHKrUA4N&index=43)

Flutter UI:
- [How to choose which Flutter Animation Widget is right for you? - Flutter Team](https://www.youtube.com/watch?v=HrBiNHEqSYU)
- [Animation deep dive(Flutter in Focus) - Flutter Team](https://www.youtube.com/watch?v=PbcILiN8rbo&t=46s)
- [Implementing complex UI with Flutter - Flutter Europe](https://www.youtube.com/watch?v=FCyoHclCqc8&t=1049s)

Flutter State Management:
- [Pragmatic State Management in Flutter (Google I/O'19)](https://www.youtube.com/watch?v=d_m5csmrf7I)
- [Pragmatic State Management Using Provider (The Boring Flutter Development Show, Ep. 24)](https://www.youtube.com/watch?v=HrBiNHEqSYU)

### Highly Recommanded Powerful Articles:

- [Flutter 跨平台演进及架构开篇](http://gityuan.com/flutter/)
- [Flutter 在阿里淘系的体系化建设和业务实践](https://developer.aliyun.com/article/771109)

## UI Design & ScreenShot

UI is designed by Sketch

![UI Design](https://github.com/LiamDai/Project_BoringMusic/blob/master/ScreenShot/sketch.png)

ScreenShot for IOS

![IOS](https://github.com/LiamDai/Project_BoringMusic/blob/master/ScreenShot/ios.png)

ScreenShot for Android

![Android](https://github.com/LiamDai/Project_BoringMusic/blob/master/ScreenShot/3.png)



