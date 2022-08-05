import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  // final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('购物车'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 107, 109, 122)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: const Text('content'),
      ),
    );
  }
}
