# Airoute 

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/airoute/blob/master/README-EN.md)|[中文文档](https://github.com/pdliuw/airoute)|
|:-|:-|

## Our aim is to help developers make development more convenient and experience the beauty of programming!

### airoute:

[![pub package](https://img.shields.io/pub/v/airoute.svg)](https://pub.dev/packages/airoute)

*1、Support routing management without context

*2、Support 'non-intrusive parameter passing' routing management

*3、Airoute that makes you fall in love with routing management

[Airoute](https://github.com/pdliuw/airoute) in the[Project](https://github.com/flutter-app-sample/flutter_app_sample)Practical application[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)

## effect

|iOS|Android|
|:-|:-|
|![airoute_ios](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_ios.gif)|![airoute_android](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_android.gif)|
|:-|:-|

|macOS|web|
|:-|:-|
|![airoute_macos](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_macos.gif)|![airoute_web](https://github.com/pdliuw/airoute/blob/master/example/raw/airoute_render_web.gif)|
|:-|:-|


## 1.Installation

Use the current package as a dependent library

### 1. Rely on this library

Add in file 'pubspec.yaml'

[![pub package](https://img.shields.io/pub/v/airoute.svg)](https://pub.dev/packages/airoute)

```

dependencies:

  airoute: ^version

```


or

```

  # Route package.
  airoute:
    git:
      url: https://github.com/pdliuw/airoute.git

```

### 2. Install this library

You can install this library via the command line below

```

$ flutter pub get


```

You can also perform the above steps through the visual operation through the project development tool


### 3. Import this library

Now, in your Dart editing code, you can use:

```

import 'package:airoute/airoute.dart';

```

## 2.Usage

### 1.Configure in your project entry 'main.dart':

Airoute Global configuration

```

void main() {
  runApp(
    ///
    /// Configuration Airoute
    Airoute.createMaterialApp(
      home: LaunchPage(),
      routes: <String, WidgetBuilder>{
        "/LaunchPage": (_) => LaunchPage(),
        "/SecondPage": (_) => SecondPage(),
      },
    ),
  );
}


```


### 2.Call / apply

*1、Jump to new page

```

              Airoute.pushNamed(routeName: "/routeName");

```

*2、Close page

```

              Airoute.pop();

```

*3、Jump to new page and add animation

```

              Airoute.pushNamedWithAnimation(
                  routeName: "/routeName",
                  routePageAnimation: AirouteTransition.Slide);

```

*4、Passing parameters, receiving parameters

Passing parameters

```

              Airoute.pushNamed(
                routeName: "/Page",
                argument: "I'm happy to meet you😄😄😄",
              );

```

Passing number parameters

```

              Airoute.pushNamed(
                routeName: "/SecondPage",
                argument: 0,
              );

```

Passing Map parameters

```
              Airoute.pushNamed(
                routeName: "/Page",
                argument: {
                  "account":"this is accont",
                  "password":"this is password ",
                },
```        

Passing Array parameters

```
              Airoute.pushNamed(
                routeName: "/Page",
                argument: [
                  "Air",
                  "James",
                  "Lucy",
                  "Tom",
                ],
              );
              
```


Receiving parameters

```

class Page extends StatefulWidget with AirArgumentReceiver {

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }

  @override
  void receive(AirArgument argument) {
    print("Received${argument.argument}parameters,I am happy😄😄😄");
  }
}


```


*5、Push route

[![pub package](https://img.shields.io/pub/v/ai_awesome_message.svg)](https://pub.dev/packages/ai_awesome_message)

```

          Airoute.push(
            route: AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "title", message: "message"),
              theme: null,
              settings: RouteSettings(name: "/messageRouteName"),
            ),
          );

```



*6、Jump to a new page and close the current page

```

              Airoute.pushReplacementNamed(
                routeName: "/routeName",
              );

```


*7、Jump to new page and close all previous pages

```

              Airoute.pushNamedAndRemoveUntil(
                newRouteName: "/routeName",
              );

```

*8、Jump to new page and close all previous pages except 'untilRouteName'

```

              Airoute.pushNamedAndRemoveUntil(
                newRouteName: "/routeName",
                untilRouteName: "/untilRouteName",
              );

```



## LICENSE

    BSD 3-Clause License
    
    Copyright (c) 2020, pdliuw
    All rights reserved.


