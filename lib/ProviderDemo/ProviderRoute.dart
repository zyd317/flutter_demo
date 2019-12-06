import 'package:flutter/material.dart';
import 'package:flutter_demo/ProviderDemo/ChangeNotifierProvider.dart';
import 'package:flutter_demo/ProviderDemo/CartModel.dart';
import 'package:flutter_demo/ProviderDemo/Item.dart';

class ProviderRoute extends StatefulWidget {
	@override
	_ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {

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
		return Center(
			child: ChangeNotifierProvider<CartModel>(
				data: CartModel(),
				child: Builder(builder: (context) {
					return Row(
						textDirection: TextDirection.ltr,
						children: <Widget>[
							Builder(builder: (context){
								var cart = ChangeNotifierProvider.of<CartModel>(context);
								return  Text("总价：${cart.totalPrice}", textDirection: TextDirection.ltr);
							}),
							Builder(builder: (context){
								print("RaisedButton build"); //在后面优化部分会用到
								return GestureDetector(
									child: Text("添加", textDirection: TextDirection.ltr),
									onTap: () {
										//给购物车中添加商品，添加后总价会更新
										ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20.0, 1));
									},
								);
							}),
						],
					);
				}),
			),
		);
	}
}