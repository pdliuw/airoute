import 'package:example/page/login_page.dart';
import 'package:example/page/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:airoute/airoute.dart';

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

///
/// FlutterRoutePreview
class FlutterRoutePreview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlutterRoutePreviewState();
  }
}

///
/// _FlutterRoutePreviewState
class _FlutterRoutePreviewState extends State<FlutterRoutePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ddd"),
    );
  }
}
