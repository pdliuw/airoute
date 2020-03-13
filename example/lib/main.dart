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

/////
///// FlutterRoutePreview
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
//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  Provider.debugCheckInvalidValueType = null;
//
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
//    (_) {
//      runApp(
//        MultiProvider(
//          providers: [
//            Provider<String>.value(
//              value: "this is test data",
//            ),
//          ],
//          child: OKToast(
//            child: StartupApplication(),
//          ),
//        ),
//      );
//    },
//  );
//}

//void test() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  Provider.debugCheckInvalidValueType = null;
//
//  SystemChrome.setPreferredOrientations(
//          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
//      .then((_) {});
//  runApp(
//    MultiProvider(
//      providers: [
//        Provider<String>.value(
//          value: "this is test data",
//        ),
//      ],
//      child: OKToast(
//        child: Airoute.createMaterialApp(
//          title: "Name",
//          theme: ThemeData(
//            fontFamily: 'IranSansLight',
//            primaryColor: Color(0xFF823A84),
//            accentColor: Color(0xFF823A84),
//            textTheme: TextTheme(
//              title:
//                  TextStyle(fontFamily: 'IranSansLight', color: Colors.black),
//            ),
//          ),
//          home: LaunchPage(),
//          routes: <String, AirouteBuilder>{
//            "/LaunchPage": () => LaunchPage(),
//            "/SecondPage": () => SecondPage(),
//          },
//        ),
//      ),
//    ),
//  );
//}
//
//class StartupApplication extends StatefulWidget {
//  @override
//  _StartupApplicationState createState() => _StartupApplicationState();
//}
//
//class _StartupApplicationState extends State<StartupApplication> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Airoute'),
//      ),
//      body: Center(
//        child: Text("Welcome......!"),
//      ),
//    );
//  }
//}
