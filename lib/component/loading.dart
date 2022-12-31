import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
          Color.fromARGB(255, 44, 89, 183),
        )),
      ),
    );
  }
}
