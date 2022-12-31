library animated_future_builder;

import 'package:flutter/material.dart';

class AnimatedFutureBuilderSwitcher {
  static Widget defaultLayoutBuilder(
      Widget? currentChild, List<Widget> previousChildren) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
    );
  }

  static AnimatedSwitcherLayoutBuilder generateLayoutBuilder(
      Alignment alignment) {
    Widget defaultLayoutBuilder(
        Widget? currentChild, List<Widget> previousChildren) {
      return Stack(
        alignment: alignment,
        children: <Widget>[
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      );
    }

    return defaultLayoutBuilder;
  }
}

class AnimatedFutureBuilder<T> extends FutureBuilder<T> {
  AnimatedFutureBuilder(
      {Key? key,
      required super.builder,
      required super.future,
      super.initialData,
      this.duration = const Duration(milliseconds: 300),
      this.reverseDuration,
      this.switchInCurve = Curves.linear,
      this.switchOutCurve = Curves.linear,
      this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
      this.alignment = Alignment.topLeft,
      AnimatedSwitcherLayoutBuilder? layoutBuilder})
      : super(key: key) {
    this.layoutBuilder = layoutBuilder == null
        ? AnimatedFutureBuilderSwitcher.generateLayoutBuilder(alignment)
        : AnimatedFutureBuilderSwitcher.defaultLayoutBuilder;
  }
  final Alignment alignment;
  final Duration? reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  late AnimatedSwitcherLayoutBuilder layoutBuilder;

  Duration duration;
  @override
  AsyncWidgetBuilder<T> get builder =>
      (BuildContext context, AsyncSnapshot<T> snapshot) {
        return AnimatedSwitcher(
          duration: duration,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve,
          switchOutCurve: switchOutCurve,
          transitionBuilder: transitionBuilder,
          layoutBuilder: layoutBuilder,
          child: super.builder(context, snapshot),
        );
      };
}
