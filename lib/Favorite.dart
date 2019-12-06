import 'package:flutter/material.dart';

void main() => runApp(AuthorSelectVideoPage());


//演示一个listView的收藏功能
//使用Navigator
class AuthorSelectVideoPage extends StatelessWidget {
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Welcome to Flutter',
      // 可以更改主体的颜色
      theme: new ThemeData(
        primaryColor: Colors.brown,
      ),
      home: new Scaffold(
        body: new Center(
          child: new ChangeStart(),
        ),
      ),
    );
  }
}

class ChangeStart extends StatefulWidget {
  @override
  createState() => new ChangeStartState();
}

class ChangeStartState extends State<ChangeStart> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var _saved = new Set<String>();

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
        title: new Text('ListView修改state之setState'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            // 定义了每一项目的东西
            final tiles = _saved.map((pair) {
              return new ListTile(
                title: new Text(
                  '----' + pair,
                  style: _biggerFont,
                ),
              );
            });

            // divided就是list的过滤器
            final divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('我已经收藏的项目如下'),
              ),
              body: new ListView(children: divided),
            );
          },
        )
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
    final alreadySaved = _saved.contains(pair);
    print('这个好像是相等？？？' + alreadySaved.toString());

    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
        print('点我干嘛+++++' + pair);
      },
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
    );
  }
}