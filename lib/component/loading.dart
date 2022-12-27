import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'loading',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
