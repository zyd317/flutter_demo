import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/MultipleProvider/LoaderContainer.dart' as LoaderStater;

/// 加载器的状态Model类
class LoaderStateModel extends ChangeNotifier {
	LoaderStater.LoaderState _state = LoaderStater.LoaderState.Loading;

	/// 构造函数
	LoaderStateModel([this._state]) {
		this._state = this._state ?? LoaderStater.LoaderState.Loading;
	}

	/// 修改状态
	///
	/// [state]  LoaderState的取值
	void changeState(LoaderStater.LoaderState state) {
		_state = state;
		notifyListeners();
	}

	/// 获取当前加载器的状态
	LoaderStater.LoaderState get state => _state;
}