import 'package:flutter/material.dart';

// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
	InheritedProvider({@required this.data, Widget child}) : super(child: child);

	//共享状态使用泛型
	final T data;

	@override
	bool updateShouldNotify(InheritedProvider<T> old) {
		//在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
		return true;
	}
}

// 该方法用于在Dart中获取模板类型
Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
	ChangeNotifierProvider({
		Key key,
		this.data,
		this.child,
	});

	final Widget child;
	final T data;

	//定义一个便捷方法，方便子树中的widget获取共享数据
	//添加一个listen参数，表示是否建立依赖关系
	static T of<T>(BuildContext context, {bool listen = true}) {
		final type = _typeOf<InheritedProvider<T>>();
		final provider = listen
				? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>
				: context.ancestorInheritedElementForWidgetOfExactType(type)?.widget
		as InheritedProvider<T>;
		return provider.data;
	}

	@override
	_ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
	void update() {
		//如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
		setState(() {

		});
	}

	@override
	void initState() {
		// 给model添加监听器
		widget.data.addListener(update);
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
		//当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
		if (widget.data != oldWidget.data) {
			oldWidget.data.removeListener(update);
			widget.data.addListener(update);
		}
		super.didUpdateWidget(oldWidget);
	}

	@override
	void deactivate() {
		// didMount。从树中删除此对象时调用
		super.deactivate();
	}

	@override
	void dispose() {
		// 移除model的监听器
		widget.data.removeListener(update);
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return InheritedProvider<T>(
			data: widget.data,
			child: widget.child,
		);
	}
}