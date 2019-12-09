/// 单个provide的情况
/// ChangeNotifierProvider 可以说是 Provider 的一种。使用它来管理只有一个共享数据类的情况比较方便。
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/SingleProvider/DataInfo.dart';

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Consumer<DataInfo>(
			builder: (context, dataInfo, _) => MaterialApp(
				home: Container(),
				theme: dataInfo.themeData,
			),
		);
	}
}
