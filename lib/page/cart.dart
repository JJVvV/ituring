import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('购物车'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 107, 109, 122)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text('content'),
      ),
    );
  }
}
