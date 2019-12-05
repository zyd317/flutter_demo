import 'package:flutter/material.dart';
import 'package:flutter_demo/ReduxDemo/ShareDataMain.dart';
import 'package:flutter_demo/ReduxDemo/TestWidget.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
	@override
	_InheritedWidgetTestRouteState createState() => new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
	int count = 10;

	@override
	Widget build(BuildContext context) {
		return Container(
			child: ShareDataWidget( // 使用ShareDataWidget
					data: count,
					child: Column(
						textDirection: TextDirection.ltr,
						children: <Widget>[
							GestureDetector(
								child: Container(
									width: 300,
									height: 500,
									margin: EdgeInsets.only(top: 40),
									decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
								),
								onTap: () => setState(() => ++count),
							),
							TestWidget(),
						],
					)
			),
		);
	}
}

void main() {
	// 创建一个 MyApp
	runApp(InheritedWidgetTestRoute());
}