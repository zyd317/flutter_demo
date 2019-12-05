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