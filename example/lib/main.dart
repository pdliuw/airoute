import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_route/flutter_route.dart';
void main() => runApp(
      new MaterialApp(
        home: WebviewScaffold(
          url: "https://github.com/pdliuw/flutter_route/blob/master/README.md",
          appBar: AppBar(
            title: Text("flutter_route"),
          ),
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          initialChild: Container(
            child: const Center(
              child: Text(
                'Loading.....',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );

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
