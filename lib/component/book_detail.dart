import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../http/repository/book_detail_data_entity.dart';

class InheritedBookDetailProvider extends InheritedWidget {
  final BookDetailDataEntity? data;
  const InheritedBookDetailProvider(
      {super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedBookDetailProvider oldWidget) {
    return oldWidget.data != data;
  }

  static InheritedBookDetailProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedBookDetailProvider>()!;
  }
}

class BookDetailWidget extends StatefulWidget {
  const BookDetailWidget({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _BookDetailState();
  }
}

class TabConfig {
  final String label;
  final Widget child;
  TabConfig(this.label, this.child);
}

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroState();
  }
}

class IntroSection extends StatelessWidget {
  final String label;
  final Widget child;

  const IntroSection({Key? key, required this.label, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4,
                height: 16,
                color: Color.fromARGB(255, 44, 89, 183),
                margin: EdgeInsets.only(right: 10),
              ),
              Text(
                label,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          child
        ],
      ),
    );
  }
}

class _IntroState extends State<Intro> {
  Widget renderContentTable(List<BookDetailDataEbookChapters> data) {
    return Column(
      children: data.map((item) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(item.subject ?? ''),
        );
      }).toList(),
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = InheritedBookDetailProvider.of(context).data;
    if (data == null) {
      return SizedBox();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntroSection(
            label: '特别说明',
            child: Html(
              data: data.briefIntro?.specialNotes ?? '',
            ),
          ),
          IntroSection(
            label: '本书特色',
            child: Html(
              data: data.briefIntro?.highlight
                      ?.replaceAll(RegExp(r'\r\n'), '<div></div>') ??
                  '',
            ),
          ),
          IntroSection(
            label: '目录',
            child: data.contentTable != null
                ? Html(data: data.contentTable)
                : renderContentTable(data.ebook?.chapters ?? []),
          ),
        ],
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContentState();
  }
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('内容'),
    );
  }
}

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DownloadState();
  }
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('下载'),
    );
  }
}

class _BookDetailState extends State<BookDetailWidget>
    with TickerProviderStateMixin {
  late List<TabConfig> tabs;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int tabIndex = 0;

  Widget renderTabView() {
    return tabs[tabIndex].child;
  }

  @override
  Widget build(BuildContext context) {
    final data = InheritedBookDetailProvider.of(context).data;
    tabs = [
      TabConfig('介绍', const Intro()),
      TabConfig("相关内容", const Content()),
      TabConfig("随书下载", const Download())
    ];
    if (data == null) {
      return const SizedBox();
    }
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          const BookHeaderWidget(),
          const BackgroundLine(),
          const BookPriceWidget(),
          const BackgroundLine(),
          TabBar(
            onTap: (index) {
              setState(() {
                tabIndex = index;
              });
            },
            controller: _tabController,
            tabs: tabs
                .map(
                  (e) => Tab(
                    child: Text(
                      e.label,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 36, 39, 51),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Container(
            // height: 4800,
            child: renderTabView(),
          ),
        ],
      ),
    );
  }
}

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

class BookHeaderWidget extends StatefulWidget {
  const BookHeaderWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BookHeaderState();
  }
}

class BookPriceWidget extends StatelessWidget {
  BookDetailDataBookEditionPrices? getEbookPrice(BookDetailDataEntity data) {
    var ebookPrice = data.bookEditionPrices!.where((price) {
      return price.key == 'Ebook';
    }).toList();
    return ebookPrice.isNotEmpty ? ebookPrice[0] : null;
  }

  const BookPriceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = InheritedBookDetailProvider.of(context).data!;
    var ebookPrice = getEbookPrice(data);
    if (ebookPrice == null) {
      return const SizedBox();
    }
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '电子书',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 36, 39, 58),
                  ),
                ),
              ),
              if (data.supportEpub ?? false) const BookFormat('epub'),
              if (data.supportMobi ?? false) const BookFormat('mobi'),
              if (data.supportPdf ?? false) const BookFormat('pdf'),
            ],
          ),
          Text('${ebookPrice.name} 元'),
        ],
      ),
    );
  }
}

class BookFormat extends StatelessWidget {
  const BookFormat(
    this.label, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  final String label;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        color: const Color.fromARGB(255, 238, 172, 87),
        margin: const EdgeInsets.only(right: 5),
        child: Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _BookHeaderState extends State<BookHeaderWidget> {
  bool abstractIsCollapsed = true;

  @override
  Widget build(BuildContext context) {
    var data = InheritedBookDetailProvider.of(context).data;
    if (data == null) {
      return const SizedBox();
    }
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
