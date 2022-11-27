import 'package:flutter/material.dart';
import 'package:ituring/component/book_detail.dart';
import 'package:ituring/http/repository/book_detail_data_entity.dart';
import 'package:ituring/http/repository/books.dart';

import '../component/loading.dart';
import '../mixin/post_frame_mixin.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BookDetailState();
  }
}

class BookScreenArguments {
  final int id;

  BookScreenArguments({
    required this.id,
  });
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
    return Text('bottom bar');
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
                  child: GestureDetector(
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
    return SizedBox(
      // width: 90,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.network(cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color.fromARGB(255, 36, 39, 51),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (author.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                author,
                softWrap: false,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color.fromARGB(255, 107, 109, 122),
                  fontSize: 14,
                ),
              ),
            )
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
    return GestureDetector(
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
