import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ituring/component/auth.dart';
import 'package:ituring/component/login_provider.dart';
import 'package:ituring/page/book_detail.dart';
import 'package:ituring/page/index.dart';
import 'package:ituring/page/login.dart';
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
  runApp(
    AuthState(
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '图灵社区',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginProvider(child: const IndexPage()),
        '/book': (context) => LoginProvider(child: const BookDetail()),
        '/tag': (context) => LoginProvider(child: TagDetail()),
        '/cart': (context) => LoginProvider(child: const Cart()),
        '/login': (context) => const Login(),
      },
    );
  }
}
