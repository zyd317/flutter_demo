/**
 * 这是一个简单的无状态组件
 * 熟悉：MaterialApp/Scaffold/AppBar
 */

import 'package:flutter/material.dart';

// 这里是入口
void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '这是一个无状态组件的测试',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      /// home传入的是一个[Widget]
      home: Scaffold(
        appBar: AppBar(
          title: Text('这是一个无状态组件的测试1'),
          backgroundColor: Color(1),
          elevation: 11,
          centerTitle: false,
          toolbarOpacity: .5,
        ),
        // 我们知道，Flutter 里所有的东西都是 widget。为了把按钮放在屏幕的中央，
        // 这里使用了 Center（它是一个 widget）。
        body: Row(
          children: <Widget>[
            Expanded(
              child:Text('绝域从军计惘然，'),
            ),
            Expanded(
              child:Text('东南幽恨满词笺。'),
            ),
            Expanded(
              child:Text('一箫一剑平生意，'),
            ),
            Expanded(
              child:Text('负尽狂名十五年。'),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue,
        floatingActionButton: Center(
          child: containerTest,
        ),
      )
    );
  }
}


var containerTest = Container(
  color: Color.fromARGB(100, 81, 211, 253),
  height: 100,
  width: 200,
  child: Text("这是一个按钮啊"),
  margin: EdgeInsets.fromLTRB(5, 10, 15, 20),
  padding:  EdgeInsets.all(40),
);