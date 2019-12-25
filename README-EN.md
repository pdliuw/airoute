# Airoute 

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/airoute/blob/master/README-EN.md)|[中文文档](https://github.com/pdliuw/airoute)|
|:-|:-|

## Our aim is to help developers make development more convenient and experience the beauty of programming!

### airoute:

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
      routes: <String, AirouteBuilder>{
        "/LaunchPage": () => LaunchPage(),
        "/SecondPage": () => SecondPage(),
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

*4、More usage[click to see more](https://github.com/pdliuw/airoute/blob/master/README_DETAIL-EN.md)



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

