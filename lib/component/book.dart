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
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 10, top: 20),
              width: 90,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    // 4px 4px 14px 0 rgb(0 0 0 / 7%), 2px 2px 6px 0 rgb(0 0 0 / 8%)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      spreadRadius: 0,
                      blurRadius: 14,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.network(
                  cover,
                  width: 90,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                maxLines: 2,
                textAlign: TextAlign.left,
                softWrap: true,
                style: const TextStyle(
                  color: Color.fromARGB(255, 36, 39, 51),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            if (author.isNotEmpty)
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  author,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 107, 109, 122),
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
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
