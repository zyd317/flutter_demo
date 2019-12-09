import 'package:flutter/material.dart';
import 'package:flutter_demo/MultipleProvider/LoaderContainer.dart';
import 'package:flutter_demo/MultipleProvider/LoaderStateModel.dart';
import 'package:provider/provider.dart';

class PresaleOrderDetailInfoPage extends StatefulWidget {
	PresaleOrderDetailInfoPage({Key key}) : super(key: key);

	@override
	State<StatefulWidget> createState() => _PresaleOrderDetailInfoPageState();
}

class _PresaleOrderDetailInfoPageState extends State<PresaleOrderDetailInfoPage> with TickerProviderStateMixin {
	/// 加载状体模型
	LoaderStateModel _loaderStateModel;

	/// 调用网络获取订单详情信息
	void _getOrderDetailInfo() async {
		_loaderStateModel.changeState(LoaderState.Loading);
		Future.delayed(Duration(seconds: 3), () { //模拟数据调用
			_loaderStateModel.changeState(LoaderState.Succeed);
		});
	}

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();

		/// 初始化加载器的状态
		final loaderStateModel =
		Provider.of<LoaderStateModel>(context);
		if (this._loaderStateModel != loaderStateModel) {
			this._loaderStateModel = loaderStateModel;
			Future.microtask(() => _getOrderDetailInfo()); //必须要这么做，不然可能会抛出异常，使用Future.microtask执行初始化任务
		}
	}
	@override
	Widget build(BuildContext context) => _buildContentView(context);

	/// 构建页面主视图
	Widget _buildContentView(BuildContext context) => Consumer<LoaderStateModel>( //使用Consumer处理共享值
		builder: (context, state, _) => LoaderContainer(
			loaderState: state.state,
			onReload: _getOrderDetailInfo,
			contentView: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: <Widget>[
					Expanded(
						child: SingleChildScrollView(
							physics: BouncingScrollPhysics(),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: <Widget>[
									Text('smkfnjgke'),
									Text('smkfnsdsdsjgke'),
									Text('sm1111kfnjgke'),
									Text('smk22222fnjgke'),
								],
							),
						),
					),
					RaisedButton(
						onPressed: ()=>{

						},
						child: Text('点我一下'),
					)
				],
			),
		),
	);
}