## 1. 下载fultter sdk

## 2. 下载gradle
gradle 是一款构建工具，构建app，android studio 中默认就使用它来构建

## 3. 下载Android studio

## 4. 安装flutter插件及dart

## 5. 配置环境变量
```
// 上海交通大学 Linux 用户组
export FLUTTER_STORAGE_BASE_URL = https://mirrors.sjtug.sjtu.edu.cn
export PUB_HOSTED_URL = https://dart-pub.mirrors.sjtug.sjtu.edu.cn

// Flutter 社区
export FLUTTER_STORAGE_BASE_URL = https://storage.flutter-io.cn
export PUB_HOSTED_URL = https://pub.flutter-io.cn
```


长期环境变量则需要修改 $HOME/.bash_profile
```
vi $HOME/.bash_profile

// 添加变量
export PATH=~/Downloads/flutter/bin:$PATH
...

// 刷新
source $HOME/.bash_profile
```

## 6. flutter doctor

## 7. 修改gradle安装依赖的地址

将android项目目录下的build.gradle中的jcenter()等引用注释掉，改成伟大的阿里的：

```
maven { url 'https://maven.aliyun.com/repository/google' }
maven { url 'https://maven.aliyun.com/repository/jcenter' }
maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
```


然后找到刚才报错的那个引用的文件：

```
C:\flutterSDK\flutter\packages\flutter_tools\gradle\flutter.gradle

```

## 8. 安装android sdk
正常来说，android studio启动的时候会自行安装，但无法翻墙的小伙伴可以访问以下连接，手动安装
```
http://www.androiddevtools.cn/
http://down.tech.sina.com.cn/page/45703.html
http://mac.softpedia.com/get/Developer-Tools/Google-Android-SDK.shtml

```

## 9. flutter run

## 10. 安装安卓虚拟机


## 常见问题
- unable to access android sdk add-on list
  
原因是没有安装android sdk， 跳过即可，软件后续会自行安装 sdk


- could not download bcpkix-jdk15on.jar
  
没有修改gradle安装依赖的地址


- INSTALL_FAILED_USER_RESTRICTED
  
魅族打开系统自带的手机管家APP，进入权限管理，点击usb安装管理，关闭 usb安装管理就可以使用


- vs code 调试打开app白屏
  
1. 打开dart日志： ctrl + shift + p -> capture logs
2. 观察到 Waiting for observatory port to be available...
3. 确定是部分机器的logcat的buffer size不足
4. 以魅族为例，开发者选项 -> 日志记录器缓冲区大小16MB（最大） -> 性能优化 -> 全部允许日志输出 