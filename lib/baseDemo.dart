import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  // 创建一个 MyApp
  runApp(MyApp());
}

/// 这个 widget 作用这个应用的顶层 widget.
/// 这个 widget 是无状态的，所以我们继承的是 [StatelessWidget].
class MyApp extends StatelessWidget {
  @override
  //描述此控件呈现在用户界面上的部分
  Widget build(BuildContext context) {
    // 我们想使用 material 风格的应用，所以这里用 MaterialApp
    return MaterialApp(
      // 移动设备使用这个 title 来表示我们的应用。具体一点说，在 Android 设备里，我们点击
      // recent 按钮打开最近应用列表的时候，显示的就是这个 title。
      title: 'Our first Flutter app v2 ',

      // 应用的“主页”
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter rolling demo v2'),
        ),
        // 我们知道，Flutter 里所有的东西都是 widget。为了把按钮放在屏幕的中央，
        // 这里使用了 Center（它是一个 widget）。
        body: Center(
          child: RollingButton(),
        ),
      ),
    );
  }
}

class RollingButton extends StatefulWidget{
  @override
  State createState(){
    return _RollingState();
  }
}

class _RollingState extends State<RollingButton>{
  @override
  Widget build(BuildContext context){
    return RaisedButton(
      child: Text('role~'),
      onPressed: _onPress,
    );
  }

  final _random = Random();

  List<int> _roll(){
    final roll1 = _random.nextInt(6);
    final roll2 = _random.nextInt(8);
    return [roll1, roll2];
  }

//  内部函数，使用_
  void _onPress(){
    debugPrint('hahhh');

    final rollResult = _roll();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text('Roll result: (${rollResult[0]}, ${rollResult[1]})'),
        );
      }
    );
  }
}