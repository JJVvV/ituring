import 'package:flutter/material.dart';
import 'package:ituring/component/animated_future_builder.dart';
import 'package:ituring/component/book_detail.dart';
import 'package:ituring/component/my_icon.dart';
import 'package:ituring/http/repository/book_detail_data_entity.dart';
import 'package:ituring/http/repository/books.dart';

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
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1.5),
    end: const Offset(0, 0),
  ).animate(_controller);

  Future<BookDetailDataEntity?> getData() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as BookScreenArguments;
    try {
      var res = await BooksRepository.getBook({"id": args.id});
      return res;
    } catch (e) {}
    return null;
  }

  final ScrollController _scrollController = ScrollController();
  @override
  initState() {
    super.initState();
    postFrame(getData);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 40) {
        if (_controller.status == AnimationStatus.forward) {
          return;
        }
        _controller.forward();
      } else {
        if (_controller.status == AnimationStatus.reverse) {
          return;
        }
        _controller.reverse();
      }
    });
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
                    '??????',
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
                    '??????',
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
            child: Ink(
              color: const Color.fromARGB(255, 44, 89, 183),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        const WidgetSpan(
                          child: Text(
                            '?????????',
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(99)),
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
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                print('??????');
              },
              child: Ink(
                color: const Color.fromARGB(255, 238, 172, 87),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '??????',
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
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFutureBuilder(
      future: getData(),
      builder: (BuildContext context,
          AsyncSnapshot<BookDetailDataEntity?> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Loading();
        }

        if (snapshot.hasError) {
          return const Text('error');
        }

        var data = snapshot.data;

        if (data == null) {
          return const Text('error');
        }

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
                        title: SlideTransition(
                          position: _offsetAnimation,
                          child: Text(
                            data.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                  body: InheritedBookDetailProvider(
                    data: data,
                    child: BookDetailWidget(
                      scrollController: _scrollController,
                    ),
                  ),
                )
              ],
            ));
      },
    );
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
                      '??????',
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
