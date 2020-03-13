# Airoute example | 爱路由 示例

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/airoute/blob/master/example/README_EN.md)|[中文文档](https://github.com/pdliuw/airoute/tree/master/example)|
|:-|:-|

## 我们的宗旨是：帮助开发者更加便利开发、切身体会编程之美！

### airoute:

[![pub package](https://img.shields.io/pub/v/airoute.svg)](https://pub.dev/packages/airoute)

*1、支持无需context的路由管理, 

*2、支持‘非侵入式参数传递’的路由管理，

*3、让你爱上路由管理的airoute

[Airoute](https://github.com/pdliuw/airoute) 在[项目](https://github.com/flutter-app-sample/flutter_app_sample)中的实战应用[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)


## 使用介绍

### 1、全局配置

```
        
        import 'package:airoute/airoute.dart';
        import 'package:example/page/launch_page.dart';
        import 'package:example/page/second_page.dart';
        import 'package:example/page/third_page.dart';
        import 'package:flutter/cupertino.dart';
        import 'package:flutter/material.dart';
        
        void main() {
          runApp(MyApp());
        }
        
        class MyApp extends StatefulWidget {
          @override
          State<StatefulWidget> createState() {
            return AppState();
          }
        }
        
        class AppState extends State<MyApp> {
          @override
          Widget build(BuildContext context) {
            return Airoute.createMaterialApp(
              home: LaunchPage(),
              routes: <String, WidgetBuilder>{
                "/LaunchPage": (_) => LaunchPage(),
                "/SecondPage": (_) => SecondPage(),
                "/ThirdPage": (_) => ThirdPage(),
              },
            );
          }
        }

        

```

### 2、LaunchPage

```
                
        import 'dart:ui';
        
        import 'package:airoute/airoute.dart';
        import 'package:flutter/material.dart';
        
        ///
        /// LaunchPage
        class LaunchPage extends StatefulWidget with AirArgumentReceiver {
          dynamic _content = "";
          @override
          void receive(AirArgument argument) {
            _content = argument.argument['content'];
          }
        
          @override
          State<StatefulWidget> createState() {
            return _LaunchState();
          }
        }
        
        /// _LaunchState
        class _LaunchState extends State<LaunchPage> {
          String _content = "";
          @override
          Widget build(BuildContext context) {
            Size size = window.physicalSize;
            double width = size.width / window.devicePixelRatio;
            double height = size.height / window.devicePixelRatio;
        
            return Scaffold(
              appBar: AppBar(
                title: Text("LaunchPage"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text("Hello world ${widget._content}"),
                    Container(
                      width: width,
                      height: height / 2,
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Center(
                        child: TextField(
                          enabled: true,
                          decoration: InputDecoration(
                            icon: Text("参数"),
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                          onChanged: (String content) {
                            _content = content;
                          },
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
        //              Airoute.pushNamedWithAnimation(
        //                routeName: "/SecondPage",
        //                routePageAnimation: (
        //                  BuildContext context,
        //                  Animation<double> animation,
        //                  Animation<double> secondaryAnimation,
        //                  Widget page,
        //                ) {
        //                  return SlideTransition(
        //                    position: Tween<Offset>(
        //                      begin: const Offset(1.0, 0.0),
        //                      end: const Offset(0.0, 0.0),
        //                    ).animate(animation),
        //                    child: page,
        //                  );
        //                },
        //              );
        //                Airoute.pushNamed(
        //                  routeName: "/SecondPage",
        //                  argument: "$_content \n 遇见你，我很开心😄😄😄",
        //                );
        //                Airoute.pushNamedWithAnimation(
        //                  routeName: "/SecondPage",
        //                  argument: "$_content \n 遇见你，我很开心😄😄😄",
        //                  duration: Duration(milliseconds: 800),
        //                  routePageAnimation: (
        //                    BuildContext context,
        //                    Animation<double> animation,
        //                    Animation<double> secondaryAnimation,
        //                    Widget page,
        //                  ) {
        //                    return FadeTransition(
        //                      opacity: CurvedAnimation(
        //                          parent: animation, curve: Curves.easeOut),
        //                      child: SlideTransition(
        //                        position: Tween<Offset>(
        //                          begin: const Offset(1.0, 0.0),
        //                          end: const Offset(0.0, 0.0),
        //                        ).animate(animation),
        //                        child: page,
        //                      ),
        //                    );
        //                  },
        //                );
        //                Airoute.pushNamedWithAnimation(
        //                  routeName: "/SecondPage",
        //                  argument: "$_content \n 遇见你，我很开心😄😄😄",
        //                  routePageAnimation: AirouteTransition.Slide,
        //                  duration: Duration(milliseconds: 500),
        //                );
        //                Airoute.pushNamedWithAnimation(
        //                  routeName: "/routeName",
        //                  argument: "$_content \n 遇见你，我很开心😄😄😄",
        ////                  duration: Duration(milliseconds: 500),
        //                  routePageAnimation: _slide,
        //                );
                        Airoute.pushNamedWithAnimation(
                          routeName: "/SecondPage",
                          argument: "$_content \n happy to see you",
                          routePageAnimation: AirouteTransition.Slide,
                        );
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text("跳转下一页"),
                    ),
                  ],
                ),
              ),
            );
          }
        }


```

### 3、SecondPage

```
    
        import 'package:flutter/material.dart';
        import 'package:airoute/airoute.dart';
        
        ///
        /// SecondPage
        class SecondPage extends StatefulWidget with AirArgumentReceiver {
          dynamic _content;
          @override
          State<StatefulWidget> createState() {
            return _SecondPageState();
          }
        
          @override
          void receive(AirArgument argument) {
            _content = argument.argument;
            print("收到${argument.argument}参数了,我很开心😄😄😄");
          }
        }
        
        ///
        /// _SecondPageState
        class _SecondPageState extends State<SecondPage> {
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.blue,
              appBar: AppBar(
                elevation: 0,
                title: Text("SecondPage"),
              ),
              body: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "以下为上页传递的数据\n\n\n${widget._content}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        Airoute.pushNamed(routeName: "/ThirdPage", argument: "Air");
                      },
                      icon: Icon(Icons.arrow_right),
                      label: Text("Next"),
                    ),
                  ],
                ),
              ),
            );
          }
        }


```

### 4、ThirdPage

```

        import 'package:flutter/material.dart';
        import 'package:airoute/airoute.dart';
        
        ///
        /// ThirdPage
        class ThirdPage extends StatefulWidget with AirArgumentReceiver {
          dynamic _content;
          @override
          State<StatefulWidget> createState() {
            return _ThirdPageState();
          }
        
          @override
          void receive(AirArgument argument) {
            _content = argument.argument;
            print("收到${argument.argument}参数了,我很开心😄😄😄");
          }
        }
        
        ///
        /// _SecondPageState
        class _ThirdPageState extends State<ThirdPage> {
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.blue,
              appBar: AppBar(
                elevation: 0,
                title: Text("ThirdPage"),
              ),
              body: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "以下为上页传递的数据\n\n\n${widget._content}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        Airoute.popUntil(untilRouteName: "/SecondPage");
                      },
                      icon: Icon(Icons.arrow_back),
                      label: Text("Back"),
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        Airoute.pushNamed(routeName: "/ThirdPage", argument: "Repeat");
                      },
                      icon: Icon(Icons.arrow_right),
                      label: Text("Next"),
                    ),
                  ],
                ),
              ),
            );
          }
        }


```