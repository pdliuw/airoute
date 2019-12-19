import 'package:flutter/material.dart';
import 'package:airoute/airoute.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text("Hello world ${widget._content}"),
          MaterialButton(
            onPressed: () {
              Airoute.pushNamed(
                routeName: "/SecondPage",
                argument: "遇见你，我很开心😄😄😄",
              );
            },
            child: Text("跳转下一页"),
          ),
        ],
      ),
    );
  }
}
