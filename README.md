# flutter_route 

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)


亮点: ``flutter_route:支持无需context的路由操作.``

[flutter_route](https://github.com/pdliuw/flutter_route) 在[项目](https://github.com/flutter-app-sample/flutter_app_sample)中的实战应用[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)

## 1.安装

使用当前包作为依赖库

### 1. 依赖此库

在文件 'pubspec.yaml' 中添加

```

  # Route package.
  flutter_route:
    git:
      url: https://github.com/pdliuw/flutter_route.git

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

import 'package:flutter_route/flutter_route.dart';

```

## 2.使用

### 1.在你的项目入口'main.dart'中配置：

简要示例

```

      ///全局静态路由的配置！
      ///路由名称前要加"/"来标记路由名！
        routes: RouteManager.initializeRoutes(
          routes: <String, WidgetBuilder>{
            "/routeName": (BuildContext context) => RouteNamePage(),
          },
        ),
        navigatorObservers: [
          RouteManager.getInstance(),
        ],


```

完整示例

```
全局静态路由配置：
void main() {

  runApp(
    MaterialApp(
      home: Scaffold(
        body: LaunchPage(),
      ),

      ///全局静态路由的配置！
      ///路由名称前要加"/"来标记路由名！
      routes: RouteManager.initializeRoutes(
        routes: <String, WidgetBuilder>{
          "/LaunchPage": (BuildContext context) => LaunchPage(),
        },
      ),
    ),
  );
}


```

### 2.调用/应用

*1、跳转新页面

```

RouteManager.getInstance().pushNamed("/routeName");

```
*2、跳转新页面，并添加动画

```

                RouteManager.getInstance().pushNamedWithAnimation(routeName: "/routeName", routePageAnimation: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget page) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(animation),
                    child: page,
                  );
                });

```

*3、跳转新页面，并关闭当前页面

```

                RouteManager.getInstance().pushReplacementNamed("/routeName");

```


*4、跳转新页面，并关闭之前的所有页面

```

RouteManager.getInstance().pushNamedAndRemoveUntil(
          newRouteName: "/routeName",
        );

```

*5、关闭当前页面

```

                RouteManager.getInstance().pop();

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

