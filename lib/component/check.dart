import 'package:flutter/material.dart';
import 'package:ituring/component/my_icon.dart';

class Check extends StatelessWidget {
  const Check({Key? key, required this.checked}) : super(key: key);
  final bool checked;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: checked
          ? const Icon(
              MyIcons.choseS,
              color: Color.fromARGB(255, 44, 89, 183),
            )
          : const Icon(
              MyIcons.choseN,
              color: Color.fromARGB(255, 107, 109, 122),
            ),
    );
  }
}
