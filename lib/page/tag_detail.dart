import 'package:flutter/material.dart';
import 'package:ituring/component/animated_future_builder.dart';
import 'package:ituring/http/repository/books.dart';
import 'package:ituring/http/repository/books_data_entity.dart';

import '../component/book.dart';
import '../component/loading.dart';

class TagScreenArguments {
  final String name;
  final String id;

  TagScreenArguments(this.id, this.name);
}

class TagDetail extends StatefulWidget {
  const TagDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BooksState();
  }
}

class _BooksState extends State<TagDetail>
    with AutomaticKeepAliveClientMixin<TagDetail> {
  BooksTag? currentTag;
  List<BooksTag> tags = [];
  int page = 1;
  String sort = 'new';
  Future<BooksDataEntity?>? future;
  List<BooksDataBookItems>? books;

  Future<BooksDataEntity?> getData() async {
    if (currentTag == null) {
      return null;
    }
    try {
      var value = await BooksRepository.getBooks(BooksParams(
        sort: sort,
        page: page,
        tag: currentTag!.value,
      ).toMap());
      hasMore = value?.pagination?.hasNextPage ?? false;
      isLoading = false;
      return value;
    } catch (e) {
      print('获取失败');
      print(e);
      isLoading = false;
      return null;
    }
  }

  final ScrollController _scrollController = ScrollController();
  bool hasMore = true;
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    future = getData();

    _scrollController.addListener(() {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        if (hasMore && !isLoading) {
          setState(() {
            page++;
            isLoading = true;
            future = getData(); //load more data
          });
        }
      }
    });

    Future.delayed(Duration.zero, () {
      final args =
          ModalRoute.of(context)!.settings.arguments as TagScreenArguments;
      setState(() {
        currentTag = BooksTag(args.name, args.id);
        future = getData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 248, 248),
      ),
      child: TagState(
        setCurrent: (item) {
          setState(() {
            currentTag = item;
            page = 1;
            books = null;
            future = getData();
          });
        },
        tags: tags,
        currentTag: currentTag,
        child: Stack(
          children: [
            NestedScrollView(
              physics: const BouncingScrollPhysics(),
              floatHeaderSlivers: true,
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: const Color.fromARGB(255, 44, 89, 183),
                    titleSpacing: 0,
                    stretch: false,
                    pinned: false,
                    floating: true,
                    title: Text(currentTag?.label ?? ''),
                    toolbarHeight: 70,
                    forceElevated: innerBoxIsScrolled,
                  ),
                ];
              },
              body: AnimatedFutureBuilder(
                future: future,
                builder: (BuildContext context,
                    AsyncSnapshot<BooksDataEntity?> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done &&
                      this.books == null) {
                    return const Loading();
                  }

                  if (snapshot.hasError) {
                    return const Text('error');
                  }

                  var books = snapshot.data?.bookItems ?? [];
                  if (this.books == null) {
                    this.books = [];
                  }
                  for (var item in books) {
                    this.books!.add(item);
                  }
                  if (books.isEmpty) {
                    return const SizedBox();
                  }

                  var childAspectRatio = 1 / 2.25;

                  return GridView.count(
                    // primary: false,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 0,
                    crossAxisCount: 3,
                    childAspectRatio: childAspectRatio,
                    children: this.books!.map((item) {
                      return BookItem(
                        name: item.name!,
                        coverKey: item.coverKey ?? '',
                        id: item.id!,
                        author: item.authors!.isEmpty
                            ? ''
                            : item.authors?[0]['name'] ?? '',
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
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

class IndexHeader extends StatefulWidget {
  const IndexHeader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexHeaderState();
  }
}

class _IndexHeaderState extends State<IndexHeader> {
  @override
  Widget build(BuildContext context) {
    final tagState = TagState.of(context);
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: 40,
          // color: Color.fromARGB(0, 44, 89, 183),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: tagState.tags.map((item) {
              return LinkTag(
                  label: item.label,
                  isSelected: item.value == tagState.currentTag!.value,
                  onTap: () {
                    tagState.setCurrent(item);
                    // Navigator.pushNamed(
                    //   context,
                    //   '/tag',
                    //   arguments: TagScreenArguments(
                    //     item.value,
                    //     item.label,
                    //   ),
                    // );
                  });
            }).toList(),
          ),
        ));
  }
}

class TagState extends InheritedWidget {
  const TagState(
      {Key? key,
      required super.child,
      required this.currentTag,
      required this.tags,
      required this.setCurrent})
      : super(key: key);
  final BooksTag? currentTag;
  final List<BooksTag> tags;
  final Function(BooksTag item) setCurrent;

  @override
  bool updateShouldNotify(TagState oldWidget) {
    return oldWidget.currentTag == null ||
        oldWidget.currentTag!.value != currentTag!.value;
  }

  static TagState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TagState>()!;
  }
}
