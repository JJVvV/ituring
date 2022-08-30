import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ituring/page/book_detail.dart';
import 'package:ituring/page/index.dart';
import 'package:ituring/page/tag_detail.dart';
import 'package:ituring/theme/app_theme.dart';

import 'page/cart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // transparent status bar
  // ));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor:
          AppTheme.themeMode == ThemeMode.dark ? Colors.black38 : Colors.white,
      statusBarIconBrightness: AppTheme.themeMode == ThemeMode.dark
          ? Brightness.light
          : Brightness.dark,
      systemNavigationBarIconBrightness: AppTheme.themeMode == ThemeMode.dark
          ? Brightness.light
          : Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
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
        '/book': (context) => const BookDetail(),
        '/tag': (context) => TagDetail(),
        '/cart': (context) => const Cart(),
      },
    );
  }

  Widget initialFunction() {
    return const IndexPage();
  }
}
