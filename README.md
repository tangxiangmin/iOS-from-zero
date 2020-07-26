

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

## UI样式及布局


下面整理了iOS开发中一些常见的UI效果实现

### 设置尺寸
```objectivec
view.frame = CGRectMake(100, 100, 100, 60)
```
### 背景色
```objectivec
view.backgroundColor = [UIColor yellowColor];
```

### 圆角
```objectivec
view.layer.masksToBounds = YES;
view.layer.cornerRadius = 35;
```

### 字体
```objectivec
label.text = @"用户昵称xxxx";
label.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
headSign.textColor = [UIColor grayColor]; // 字体颜色
```
### 边框
设置全边框**
```objectivec
view.layer.borderWidth = 1;
view.layer.borderColor = [[UIColor grayColor] CGColor];
```
`UIKit`并没有提供单边框的功能，因此需要自己实现，原理就是通过subLayer在view对应方位画一条线，
```objectivec
UIView *test = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 375, 50)];
CALayer *layer = [CALayer layer];
layer.frame = CGRectMake(0, test.frame.size.height - 1, test.frame.size.width, 1);
layer.backgroundColor = [[UIColor grayColor] CGColor];
[test.layer addSublayer:layer]; // 将绘制border的layer添加到当前图层
```
### 阴影

参考:[在 iOS 里 100% 还原 Sketch 实现的阴影效果](https://juejin.im/post/5dd4cd71f265da0bf80b5820)

跟上面的单边框类似，需要自己修改layer实现。

### 使用flex布局
参考
* [在iOS中使用FlexBox](https://juejin.im/post/5a33a6926fb9a045104a8d3c)


体验了iOS内置的布局方式
* frame布局，比较简单，类似于所有view都使用绝对定位+定位尺寸实现，缺点在于需要自己计算，在一些需要自动填充尺寸的场景中很麻烦
* autoLayout布局，看了一下语法就溜了，太繁琐了

使用`YoGaKit`可以实现类似于Web的Flex布局，`Yoga`实现的是W3C关于FlexBox的一个子集

先吐个槽，为啥实现下面这个布局要写写上将近100行代码，我的打开方式不对？

![](http://img.shymean.com/oPic/1595751377892_382.png)

首先安装依赖
```podfile
use_frameworks!
target 'iOSSample' do
    pod 'Yoga' # Yoga实现
    pod 'YogaKit' # Yoga提供的Objective-C和swift库
end
```
然后引入`#import <YogaKit/UIView+Yoga.h>`，实现了`UIView`对象的`configureLayoutWithBlock`方法，flex布局属性均在该Block中配置

```objectivec
UIView *head = [[UIView alloc] init];
// 可以看见一些比较熟悉的web样式声明语法
[head configureLayoutWithBlock:^(YGLayout *layout) {
    layout.isEnabled = YES;
    layout.width = YGPointValue(375);
    layout.height = YGPointValue(90);
    layout.marginLeft = YGPointValue(0);
    layout.paddingHorizontal = YGPointValue(10);

    layout.alignItems = YGAlignCenter;
    layout.flexDirection = YGFlexDirectionRow;
}];
```
具体使用还在进一步探索中...

## 语法补充
* [ObjectiveC中的回调](https://www.jianshu.com/p/376ba5343097)，了解委托、事件通知、block的语法和使用

## 各页面学习内容

### 登录页

登录页主要了解基础frame布局、`UITextField`、点击事件、`AFNetworking`等基本使用
