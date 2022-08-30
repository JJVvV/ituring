import 'package:flutter/material.dart';
import 'package:ituring/http/repository/book_detail_data_entity.dart';

class BookDetailWidget extends StatelessWidget {
  const BookDetailWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final BookDetailDataEntity data;

  @override
  Widget build(BuildContext context) {
    var tags = (data.tags ?? []).map((item) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        margin: const EdgeInsets.only(right: 5, bottom: 5),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 228, 242, 252),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(2),
          ),
        ),
        child: Text(
          item.name,
          softWrap: false,
          style: const TextStyle(
            color: Color.fromARGB(255, 44, 89, 183),
            fontSize: 12,
          ),
        ),
      );
    }).toList();
    return Container(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            data.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Line(
                    label: '作者',
                    child: Expanded(
                      child: Text(
                        data.authorNameString,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 107, 109, 122),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
                  if (data.translatorNameString != null &&
                      data.translatorNameString!.isNotEmpty)
                    Line(
                      label: '译者',
                      child: Expanded(
                        child: Text(
                          data.translatorNameString!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 107, 109, 122),
                          ),
                        ),
                      ),
                    ),
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
                  Line(
                    label: '标签',
                    child: Expanded(
                      child: Wrap(
                        children: tags,
                      ),
                    ),
                  ),
                  Line(
                    label: '简介',
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.xAbstract ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 107, 109, 122),
                            ),
                          ),
                          const Text(
                            '+展开',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 89, 183),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 110,
              child: Column(
                children: [
                  Image.network(
                    'https://file.ituring.com.cn/LargeCover/${data.coverKey}',
                    width: 110,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 107, 109, 122),
            ),
          ),
        ),
        child
      ],
    );
  }
}
