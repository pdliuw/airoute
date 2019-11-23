# flutter_route 

![totem](https://github.com/pdliuw/pdliuw.github.io/blob/master/images/totem_four_logo.jpg?raw=true)


特点: ``**flutter_route:支持无需context的路由操作.**``

[flutter_route](https://github.com/pdliuw/flutter_route) 在[项目](https://github.com/flutter-app-sample/flutter_app_sample)中的实战应用[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)

## 依赖


## 使用

### 步骤1：配置

简要示例

```

      ///全局静态路由的配置！
      ///路由名称前要加"/"来标记路由名！
      routes: RouteManager.initializeRoutes(
        routes: <String, WidgetBuilder>{
          "/LaunchPage": (BuildContext context) => LaunchPage(),
        },
      ),

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

#### 步骤2：调用/应用

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

