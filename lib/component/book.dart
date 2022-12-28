import 'package:flutter/material.dart';

class BookScreenArguments {
  final int id;

  BookScreenArguments({
    required this.id,
  });
}

class Book extends StatelessWidget {
  const Book({
    Key? key,
    required this.name,
    required this.cover,
    this.author = '',
  }) : super(key: key);
  final String name;
  final String cover;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 90,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 20),
              child: Image.network(cover, width: 90, height: 120),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                name,
                maxLines: 2,
                softWrap: true,
                style: const TextStyle(
                  color: Color.fromARGB(255, 36, 39, 51),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (author.isNotEmpty)
              Text(
                author,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color.fromARGB(255, 107, 109, 122),
                  fontSize: 14,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.name,
    required this.coverKey,
    required this.id,
    this.author = '',
  }) : super(key: key);
  final String name;
  final String coverKey;
  final String author;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/book',
          arguments: BookScreenArguments(
            id: id,
          ),
        );
      },
      child: Book(
        name: name,
        cover: "https://file.ituring.com.cn/SmallCover/${coverKey}",
        author: author,
      ),
    );
  }
}
