import 'package:flutter/material.dart';
import 'package:ituring/component/book_detail.dart';
import 'package:ituring/http/repository/book_detail_data_entity.dart';
import 'package:ituring/http/repository/books.dart';
import 'package:ituring/my_icon.dart';

import '../component/book.dart';
import '../component/loading.dart';
import '../mixin/post_frame_mixin.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BookDetailState();
  }
}

class _BookDetailState extends State<BookDetail>
    with PostFrameMixin, TickerProviderStateMixin {
  bool isLoading = false;
  BookDetailDataEntity? data;
  void getData() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as BookScreenArguments;
    try {
      var res = await BooksRepository.getBook({"id": args.id});
      var book = BookDetailDataEntity.fromJson(res as dynamic);
      setState(() {
        data = book;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  final ScrollController _scrollController = ScrollController();
  @override
  initState() {
    super.initState();
    postFrame(getData);
  }

  Widget renderBottomBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 229, 232),
          ),
        ),
      ),
      height: 51,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    MyIcons.recommend,
                    color: Color.fromARGB(255, 107, 109, 122),
                    size: 16,
                  ),
                  Text(
                    '推荐',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 107, 109, 122),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    MyIcons.collect,
                    color: Color.fromARGB(255, 107, 109, 122),
                    size: 16,
                  ),
                  Text(
                    '收藏',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 107, 109, 122),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              color: Color.fromARGB(255, 44, 89, 183),
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      const WidgetSpan(
                        child: Text(
                          '购书袋',
                          style: TextStyle(
                            height: 1,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          margin: EdgeInsets.only(left: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(99)),
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              height: 1,
                              color: Color.fromARGB(255, 44, 89, 183),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                print('购买');
              },
              child: Container(
                color: Color.fromARGB(255, 238, 172, 87),
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '购买',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderBody() {
    if (isLoading || data == null) {
      return const Loading();
    }
    return InheritedBookDetailProvider(
      data: data!,
      child: BookDetailWidget(
        scrollController: _scrollController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('book?.name');
    print(data?.name);

    return Scaffold(
        bottomNavigationBar: renderBottomBar(),
        body: Stack(
          children: [
            NestedScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    titleSpacing: 0,
                    stretch: false,
                    pinned: true,
                    // collapsedHeight: 30,
                    title: Text(
                      data?.name ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                    toolbarHeight: 50,
                    // expandedHeight: 20,
                    forceElevated: innerBoxIsScrolled,
                    iconTheme: const IconThemeData(
                      color: Color.fromARGB(255, 107, 109, 122),
                    ),
                  ),
                ];
              },
              body: renderBody(),
            )
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.title,
    this.child,
    required this.onMore,
  }) : super(key: key);
  final String title;
  final Widget? child;
  final Function onMore;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Image.asset(
                        'images/section-icon.png',
                        width: 20,
                        height: 24,
                      ),
                    ),
                    Text(title)
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 248, 248, 248),
                  ),
                  child: InkWell(
                    onTap: () {
                      onMore();
                    },
                    child: const Text(
                      '更多',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 107, 109, 122),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (child != null) child!
        ],
      ),
    );
  }
}

class LinkTag extends StatelessWidget {
  const LinkTag({
    Key? key,
    required this.onTap,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);
  final String label;
  final Function onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: const BoxDecoration(
            // color: Color.fromARGB(255, 29, 70, 157),
            // borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        margin: const EdgeInsets.only(right: 5),
        child: Text(
          label,
          style: TextStyle(
            fontSize: isSelected ? 20 : 14,
            color: isSelected
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(137, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
