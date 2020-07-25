

## web前端学习iOS开发

参考：[从0开发一款iOS App](https://time.geekbang.org/course/intro/100025901)

相关整理: todo ，后面会同步到[我的博客](https://www.shymean.com)上


* UI及布局，掌握MVC结构，了解`UIView`和`UIViewController`
  * `frame`布局，声明view在视图中的具体尺寸，包括宽高、xy坐标等
  * `autoLayout`，通过约束实现布局，主要是声明某个view与其他view的布局关系实现
  * 一些第三方的布局方案，如`flexBox`等
  * 屏幕适配
* 事件交互
  * `UIControl`及`Target-Action`监听事件，给view添加事件及注册处理函数
  * 使用`UIGestureRecognizer`实现自定义点击与手势，构造一个事件识别函数，然后绑定到某个view上
* `UIKit`库使用
  * 掌握`UIWindow`、`UIScrollView`、`UILabel`、`UIImage`等基础组件
  * 使用`delegate`实现自定义业务逻辑
  * `WKWebView`基本使用，了解Native与JavaScript交互及通信
* 本地存储
  * 了解iOS文件沙盒机制
* 网络
  * 了解iOS网络库使用
  * JSON序列化与反序列化
* iOS应用基本结构
  * 应用生命周期、通知、`URL-Schema`
  * 了解签名、证书、打包和发布相关流程
  * `cocoapods`管理第三方库

只要了解了上面的功能，就可以实现一个完整的iOS应用。接下来将实现一个包含如下功能的应用

* 登录页，实现文本输入、本地存储、页面跳转
* 内容列表页，包含网络请求，文本图片内容布局、列表滚动
* 内容详情页，

## UI样式

设置尺寸
```objectivec
frame = CGRectMake(100, 100, 100, 60)
```

## 语法补充
* [ObjectiveC中的回调](https://www.jianshu.com/p/376ba5343097)，了解委托、事件通知、block的语法和使用

## 登录页

登录页主要了解基础frame布局、`UITextField`、点击事件、`AFNetworking`等基本使用