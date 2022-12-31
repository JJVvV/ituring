import 'package:flutter/material.dart';

class AnimatedFutureBuilder<T> extends FutureBuilder<T> {
  AnimatedFutureBuilder({
    Key? key,
    required super.builder,
    required super.future,
    super.initialData,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);
  Duration duration;
  @override
  AsyncWidgetBuilder<T> get builder =>
      (BuildContext context, AsyncSnapshot<T> snapshot) {
        return AnimatedSwitcher(
          duration: duration,
          child: super.builder(context, snapshot),
        );
      };
}
