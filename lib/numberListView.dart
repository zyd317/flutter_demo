import 'package:flutter/material.dart';

void main() => runApp(AuthorSelectVideoPage());


/// list view演示。无限滚动，展示数字列表。使用ListView
class AuthorSelectVideoPage extends StatelessWidget {
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // 当此State对象的依赖项更改时调用
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(oldWidget) {
    // 每当窗口小部件配置更改时调用
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // didMount。从树中删除此对象时调用
    super.deactivate();
  }

  @override
  void dispose() {
    // 释放资源,将该对象从树中永久删除时调用(动画等)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return _buildRow(i.toString());
        }
    );
  }

  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      onTap: () {
        print('点我干嘛+++++' + pair);
      },
    );
  }
}