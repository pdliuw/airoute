# Airoute example

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/airoute/blob/master/example/README_EN.md)|[中文文档](https://github.com/pdliuw/airoute/tree/master/example)|
|:-|:-|

## Our aim is to help developers make development more convenient and experience the beauty of programming!

### airoute:

[![pub package](https://img.shields.io/pub/v/airoute.svg)](https://pub.dev/packages/airoute)

*1、Support routing management without context

*2、Support 'non-intrusive parameter passing' routing management

*3、Airoute that makes you fall in love with routing management

[Airoute](https://github.com/pdliuw/airoute) in the[Project](https://github.com/flutter-app-sample/flutter_app_sample)Practical application[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)


## Usage

### 1、Global config

```
        
        import 'package:example/page/login_page.dart';
        import 'package:example/page/second_page.dart';
        import 'package:flutter/cupertino.dart';
        import 'package:flutter/material.dart';
        import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
        import 'package:airoute/airoute.dart';
        
        void main() {
          runApp(
            ///
            /// Global config Airoute
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

### 2、LaunchPage

```
        
        import 'package:flutter/material.dart';
        import 'package:airoute/airoute.dart';
        import 'dart:ui';
        
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
            return _LoginState();
          }
        }
        
        /// _LoginState
        class _LoginState extends State<LaunchPage> {
          String _content = "";
          @override
          Widget build(BuildContext context) {
            Size size = window.physicalSize;
            double width = size.width / window.devicePixelRatio;
            double height = size.height / window.devicePixelRatio;
        
            return Scaffold(
              appBar: AppBar(),
              body: Column(
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
                      Airoute.pushNamed(
                        routeName: "/SecondPage",
                        argument: "$_content \n 遇见你，我很开心😄😄😄",
                      );
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text("跳转下一页"),
                  ),
                ],
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
              ),
              body: Center(
                child: Text(
                  "以下为上页传递的数据\n\n\n${widget._content}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        }


```
