import 'package:flutter/material.dart';

class TagScreenArguments {
  final String name;
  final String id;

  TagScreenArguments(this.id, this.name);
}

class TagDetail extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as TagScreenArguments;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(args.name),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 107, 109, 122),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Text(
        '${args.name}: ${args.id}',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
