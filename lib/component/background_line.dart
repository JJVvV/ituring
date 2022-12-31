import 'package:flutter/material.dart';

class BackgroundLine extends StatelessWidget {
  const BackgroundLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 248, 248, 248),
      height: 10,
    );
  }
}
