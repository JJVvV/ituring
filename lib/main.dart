import 'package:flutter/material.dart';
import 'package:ituring/index.dart';

import 'cart.dart';

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
        '/tag': (context) => Text('tag page'),
        '/cart': (context) => Cart(),
        // '/setting': (context) => const SettingPage(),
        // '/about': (context) => AboutScreen(),
        // '/playlists': (context) => PlaylistScreen(),
        // '/nowplaying': (context) => NowPlaying(),
        // '/recent': (context) => RecentlyPlayed(),
        // '/downloads': (context) => const Downloads(),
      },
    );
  }

  Widget initialFunction() {
    return const IndexPage();
  }
}
