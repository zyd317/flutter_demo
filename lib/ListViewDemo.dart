/**
 * flutter学习第二部
 */
import 'package:flutter/material.dart';

void main() => runApp(ListViewDemo());


class ListViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '这是一个MaterialApp的demo，熟悉有哪些属性',
      home: Scaffold(
        appBar: AppBar(
          title: Text('这是一个无状态组件的测试1'),
          backgroundColor: Color(1),
          elevation: 11,
          centerTitle: false,
          toolbarOpacity: .5,
        ),
        body: listViewTest,
        floatingActionButton: barContainer,
      ),
    );
  }
}
var barContainer = Container(
  color: Color.fromARGB(255, 255, 255, 255),
  height: 100,
  width: 200,
  child: Text("这是一个按钮啊"),
  margin: EdgeInsets.fromLTRB(5, 10, 15, 20),
  padding:  EdgeInsets.all(40),
);
var listViewTest = ListView.builder(
  itemCount: 20,
  padding: EdgeInsets.all(8.0),
  itemExtent: 60.0,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child: Center(child: Text('toly $index')),
    );
  },
);

var listViewTestRow = ListView.builder(
  itemCount: 20,
  padding: EdgeInsets.all(8.0),
  scrollDirection:Axis.horizontal,
  itemExtent: 60.0,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child: Center(child: Text('toly $index')),
    );
  },
);