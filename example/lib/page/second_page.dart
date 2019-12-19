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
      appBar: AppBar(),
      body: Column(
        children: <Widget>[Text("Second page ${widget._content}")],
      ),
    );
  }
}
