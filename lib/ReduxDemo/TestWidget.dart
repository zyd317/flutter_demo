import 'package:flutter/material.dart';
import 'package:flutter_demo/ReduxDemo/ShareDataMain.dart';
class TestWidget extends StatefulWidget {
	@override
	__TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<TestWidget> {

	@override
	void initState() {
		super.initState();
	}

	@override
	void didChangeDependencies() {
		// 当此State对象的依赖项更改时调用
		super.didChangeDependencies();
		//父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
		//如果build中没有依赖InheritedWidget，则此回调不会被调用。
		print("Dependencies change");
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
		//使用InheritedWidget中的共享数据
		return Text(ShareDataWidget.of(context).data.toString(), textDirection: TextDirection.ltr);
	}
}