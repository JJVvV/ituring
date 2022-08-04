import 'package:flutter/material.dart';

class CartScreenArguments {
  final String title;
  final int id;

  CartScreenArguments(this.id, this.title);
}

class Cart extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CartScreenArguments;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(args.title),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 107, 109, 122)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Text(args.title),
    );
  }
}
