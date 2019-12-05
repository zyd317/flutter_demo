import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/slider.dart';
import '../data/recommendList.dart';

class Recommend extends StatefulWidget {
  final TextStyle _notInheritBigFont =
     new TextStyle(inherit: false, fontSize: 20.0, color: Colors.yellow);
    
   _RecommendState createState() => new _RecommendState();
}


class _RecommendState extends State<Recommend> {
  // List<Model> data = [];
  List _data = [];

  void initState() {
    super.initState();
    _loadDataFromNetwork();
  }


  _hotKeyUrl() {
    return 'http://ustbhuangyi.com/music/api/getDiscList?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=json&platform=yqq&hostUin=0&sin=0&ein=29&sortId=5&needNewCode=0&categoryId=10000000&rnd=0.23358193201300614';
  }


  _loadDataFromNetwork() async {
    http.Response _response = await http.get(_hotKeyUrl());
    final _jsonRes = json.decode(_response.body);
    ListProperty proList = new ListProperty.fromJson(_jsonRes);
    proList.data.list.forEach((item) {
      _data.add(item);
    });
    if (this.mounted) {
      setState(() {
        _data = _data;
      });
    }
  }

  List<Widget> listMyWidgets() {
    List<Widget> recoList = new List();
    if (_data.length > 0) {
      _data.forEach((item) {
        var i = getItem(item);
        recoList.add(i);
      });
    }
    return recoList;
  }


  getItem(var item) {
    var row = new GestureDetector(
      onTap: () {
        print('click');
      },
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850],
              blurRadius: 5.0, // has the effect of softening the shadow
              offset: Offset(
                0.0, // horizontal, move right 2
                3.0, // vertical, move down 2
              ),
            )
          ],
        ),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: <Widget>[
            Image.network(
                item.imgurl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.fill
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 10.0),
              height: 100.0,
              width: 250.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text(
                    item.creator.name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  new Text(
                    item.dissname,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return Card(child: row,);
  }


  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return new MaterialApp(
        home: new Scaffold(
            body: new Container(
                decoration: new BoxDecoration(
                    color: Colors.black
                ),
                child: Column(
                  children: <Widget>[
                    new Container(
                      width: width,
                      decoration: new BoxDecoration(
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
                      child: new Column(
                        children: <Widget>[
                          new Text('热门歌单推荐', style: widget._notInheritBigFont),
                        ],
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      // 可滚动
                      child: new SingleChildScrollView(
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.black
                          ),
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: listMyWidgets()
                          ),
                        ),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}