import 'package:flutter/material.dart';
import 'package:ituring/index.dart';
import 'package:ituring/page/tag_detail.dart';

import 'page/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '图灵社区',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => initialFunction(),
        '/book': (context) => Text('book page'),
        '/tag': (context) => TagDetail(),
        '/cart': (context) => Cart(),
      },
    );
  }

  Widget initialFunction() {
    return const IndexPage();
  }
}
