# Airoute 

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

## 我们的宗旨是：帮助开发者更加便利开发、切身体会编程之美！

### airoute:

*1、支持无需context的路由管理, 
*2、支持‘非侵入式参数传递’的路由管理，
*3、让你爱上路由管理的airoute

[Airoute](https://github.com/pdliuw/airoute) 在[项目](https://github.com/flutter-app-sample/flutter_app_sample)中的实战应用[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)

## 效果图

|![airoute_ios](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_ios.gif)|![airoute_android](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_android.gif)|
|:-|:-|
|![airoute_macos](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_macos.gif)|![airoute_web](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_web.gif)|
|:-|:-|

## 1.安装

使用当前包作为依赖库

### 1. 依赖此库

在文件 'pubspec.yaml' 中添加

```

  # Route package.
  airoute:
    git:
      url: https://github.com/pdliuw/airoute.git

```

### 2. 安装此库

你可以通过下面的命令行来安装此库

```

$ flutter pub get


```

你也可以通过项目开发工具通过可视化操作来执行上述步骤

### 3. 导入此库

现在，在你的Dart编辑代码中，你可以使用：

```

import 'package:airoute/airoute.dart';

```

## 2.使用

### 1.在你的项目入口'main.dart'中配置：

Airoute 全局配置

```

void main() {
  runApp(
    ///
    /// 配置Airoute
    Airoute.createMaterialApp(
      home: LaunchPage(),
      routes: <String, AirouteBuilder>{
        "/LaunchPage": () => LaunchPage(),
        "/SecondPage": () => SecondPage(),
      },
    ),
  );
}


```


### 2.调用/应用

*1、跳转新页面

```

              Airoute.pushNamed(routeName: "/routeName");

```

*2、关闭页面

```

              Airoute.pop();

```

*3、跳转新页面，并添加动画

```

              Airoute.pushNamedWithAnimation(
                  routeName: "/routeName",
                  routePageAnimation: AirouteTransition.Slide);

```

内置动画：

侧滑：AirouteTransition.Slide
渐变：AirouteTransition.Fade
缩放：AirouteTransition.Scale
旋转：AirouteTransition.Rotation

*4、传递参数、接收参数

传递参数

```

              Airoute.pushNamed(
                routeName: "/Page",
                argument: "遇见你，我很开心😄😄😄",
              );

```

接收参数

```

class Page extends StatefulWidget with AirArgumentReceiver {

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }

  @override
  void receive(AirArgument argument) {
    print("收到${argument.argument}参数了,我很开心😄😄😄");
  }
}


```

*5、跳转新页面，并关闭当前页面

```

              Airoute.pushReplacementNamed(
                routeName: "/routeName",
              );

```


*6、跳转新页面，并关闭之前的所有页面

```

              Airoute.pushNamedAndRemoveUntil(
                newRouteName: "/routeName",
              );

```

*7、跳转新页面，并关闭除'untilRouteName'外的之前的所有页面

```

              Airoute.pushNamedAndRemoveUntil(
                newRouteName: "/routeName",
                untilRouteName: "/untilRouteName",
              );

```



## LICENSE

   Copyright 2019 pdliuw

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

