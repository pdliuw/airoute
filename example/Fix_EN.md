## Fix something!


![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/airoute/blob/master/example/Fix_EN.md)|[中文文档](https://github.com/pdliuw/airoute/blob/master/example/Fix.md)|
|:-|:-|


### 1、observer.navigator == null

#### 1、Code:

``` 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MultiProvider(providers: providers, child: OKToast(child: StartupApplication())));
  });
}
}

class StartupApplication extends StatefulWidget {
  @override
  _StartupApplicationState createState() => _StartupApplicationState();
}

class _StartupApplicationState extends State<StartupApplication> {
  @override
  Widget build(BuildContext context) {
    return Airoute.createMaterialApp(
      title: Fa.appName,
      theme: ThemeData(
        fontFamily: 'IranSansLight',
        primaryColor: Color(0xFF823A84),
        accentColor: Color(0xFF823A84),
        textTheme: TextTheme(title: TextStyle(fontFamily: 'IranSansLight', color: Colors.black)),
      ),
      home: Directionality(),
      routes: <String, AirouteBuilder>{
        "/home": () => Home(),
        "/lesson": () => LessonsPage(),
        "/play": () => LessonDetail(),
        "/certificateOfDisclaimer": () => LessonsCertificateOfDisclaimer(),
        "/tickets": () => Tickets(),
        "/keywords": () => Keywords(),
        "/faq": () => Faq(),
        "/aboutUs": () => AboutUs(),
        "/contactUs": () => ContactUs(),
        "/serviceRole": () => ServiceRole(),
        "/showLessonParts": () => ShowLessonParts(),
        "/main_route": () => MainRoute(),
        "/pageConceptsInformation": () => ShowPageConceptsInformation(),
        "/pageLessonsDescription": () => ShowPageLessonsDescription(),
        "/profileCode": () => ProfileCode(),
        "/market": () => Market(),
        "/results": () => Results(),
        "/documents": () => Documents(),
        "/lessonDescription": () => LessonDescription(),
        "/monthDescription": () => MonthDescription(),
        "/readMeLesson": () => ReadmeLesson(),
        "/logout": () => Logout(),
        "/showDocumentContent": () => ShowDocumentContent(),
      },
    );
  }
}

```

#### 2、Error:

```

════════ Exception caught by widgets library ═════════
The following assertion was thrown building Builder:
'package:flutter/src/widgets/navigator.dart': Failed assertion: line 1578 pos 16: 'observer.navigator == null': is not true.


Either the assertion indicates an error in the framework itself, or we should provide substantially more information in this error message to help you determine and fix the underlying cause.
In either case, please report this assertion by filing a bug on GitHub:
  https://github.com/flutter/flutter/issues/new?template=BUG.md

The relevant error-causing widget was: 
  MaterialApp file:///C:/Users/mahdi/AppData/Roaming/Pub/Cache/hosted/pub.dartlang.org/airoute-0.1.4/lib/route/app.dart:45:12
When the exception was thrown, this was the stack: 
#2      NavigatorState.didUpdateWidget (package:flutter/src/widgets/navigator.dart:1578:16)
#3      StatefulElement.update (package:flutter/src/widgets/framework.dart:4396:58)
#4      Element.updateChild (package:flutter/src/widgets/framework.dart:2977:15)
#5      ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:4243:16)
#6      Element.rebuild (package:flutter/src/widgets/framework.dart:3947:5)
 
```

#### 3、Solution or Answer

Before solving the problem:

```

    
    dependencies:
      flutter:
        sdk: flutter
    
      # The following adds the Cupertino Icons font to your application.
      # Use with the CupertinoIcons class for iOS style icons.
      cupertino_icons: ^0.1.2
    
      # Route
      airoute: ^0.1.6
      provider: ^4.0.1
      oktoast: ^2.3.0
    


```

```
        void main() async {
          WidgetsFlutterBinding.ensureInitialized();
          Provider.debugCheckInvalidValueType = null;
        
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
            runApp(MultiProvider(providers: [
              Provider<String>.value(
                value: "this is test data",
              ),
            ], child: OKToast(child: StartupApplication())));
          });
        }

```

```

        
        class StartupApplication extends StatefulWidget {
          @override
          _StartupApplicationState createState() => _StartupApplicationState();
        }
        
        class _StartupApplicationState extends State<StartupApplication> {
          @override
          Widget build(BuildContext context) {
            return Airoute.createMaterialApp(
              title: "Name",
              theme: ThemeData(
                fontFamily: 'IranSansLight',
                primaryColor: Color(0xFF823A84),
                accentColor: Color(0xFF823A84),
                textTheme: TextTheme(
                  title: TextStyle(fontFamily: 'IranSansLight', color: Colors.black),
                ),
              ),
              home: LaunchPage(),
              routes: <String, AirouteBuilder>{
                "/LaunchPage": () => LaunchPage(),
                "/SecondPage": () => SecondPage(),
              },
            );
          }
        }


```

After solving the problem:

```

    
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      Provider.debugCheckInvalidValueType = null;
    
      SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
          .then((_) {});
      runApp(
        MultiProvider(
          providers: [
            Provider<String>.value(
              value: "this is test data",
            ),
          ],
          child: OKToast(
            child: Airoute.createMaterialApp(
              title: "Name",
              theme: ThemeData(
                fontFamily: 'IranSansLight',
                primaryColor: Color(0xFF823A84),
                accentColor: Color(0xFF823A84),
                textTheme: TextTheme(
                  title:
                      TextStyle(fontFamily: 'IranSansLight', color: Colors.black),
                ),
              ),
              home: StartupApplication(),
              routes: <String, AirouteBuilder>{
                "/LaunchPage": () => LaunchPage(),
                "/SecondPage": () => SecondPage(),
              },
            ),
          ),
        ),
      );
    }
    
    class StartupApplication extends StatefulWidget {
      @override
      _StartupApplicationState createState() => _StartupApplicationState();
    }
    
    class _StartupApplicationState extends State<StartupApplication> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Airoute'),
          ),
          body: Center(
            child: Text("Welcome......!"),
          ),
        );
      }
    }


```


-----