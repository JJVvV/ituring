import 'package:flutter/material.dart';
import 'package:ituring/http/repository/book_detail_data_entity.dart';

class BookDetailWidget extends StatelessWidget {
  final BookDetailDataEntity data;

  const BookDetailWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BookHeaderWidget(data: data),
          Container(
            color: const Color.fromARGB(255, 248, 248, 248),
            height: 10,
          ),
          BookPriceWidget(),
        ],
      ),
    );
  }
}

class BookHeaderWidget extends StatefulWidget {
  const BookHeaderWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final BookDetailDataEntity data;
  @override
  State<StatefulWidget> createState() {
    return _BookHeaderState();
  }
}

class BookPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

class _BookHeaderState extends State<BookHeaderWidget> {
  bool abstractIsCollapsed = true;

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
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
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          maxLines: abstractIsCollapsed ? 3 : 200,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 107, 109, 122),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              abstractIsCollapsed = !abstractIsCollapsed;
                            });
                          },
                          child: Text(
                            abstractIsCollapsed ? '+ 展开' : '- 收起',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 89, 183),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 110,
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        spreadRadius: -4,
                        blurRadius: 12,
                        offset: Offset(0, 8), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: -4,
                        blurRadius: 6,
                        offset: Offset(0, 6), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://file.ituring.com.cn/LargeCover/${data.coverKey}',
                    width: 110,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 227, 229, 232),
                    ),
                  ),
                  child: Column(
                    children: [
                      BookCountStateRow(
                        label: '阅读',
                        value: '${data.viewCount ?? 0}',
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 227, 229, 232),
                            ),
                          ),
                        ),
                      ),
                      BookCountStateRow(
                        label: '推荐',
                        value: '${data.voteCount ?? 0}',
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BookCountStateRow extends StatelessWidget {
  final String label;
  final String value;

  const BookCountStateRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: RichText(
            text: TextSpan(children: [
              WidgetSpan(
                child: Container(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    label,
                    style: const TextStyle(
                      height: 1,
                      color: Color.fromARGB(255, 104, 118, 113),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  height: 1,
                  color: Color.fromARGB(255, 104, 118, 113),
                  fontSize: 14,
                ),
              )
            ]),
          ),
        ),
      ],
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
