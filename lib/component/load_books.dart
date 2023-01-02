import 'package:flutter/material.dart';
import 'package:ituring/component/animated_future_builder.dart';
import 'package:ituring/http/repository/books_data_entity.dart';
import 'package:ituring/mixin/post_frame_mixin.dart';
import 'package:ituring/model/page_data.dart';

import './book.dart';
import './loading.dart';

class LoadBooks extends StatefulWidget {
  final int buff;
  ScrollController? controller;
  final Map<String, dynamic> defaultParams;
  Future<PageData<BooksDataBookItems>?> Function(Map<String, dynamic>? params)
      getData;

  LoadBooks({
    Key? key,
    required this.buff,
    required this.controller,
    required this.getData,
    required this.defaultParams,
  }) : super(key: key);

  @override
  createState() {
    return LoadBooksState();
  }
}

class LoadBooksState extends State<LoadBooks>
    with PostFrameMixin, AutomaticKeepAliveClientMixin<LoadBooks> {
  int page = 1;
  String sort = 'new';
  List<BooksDataBookItems>? books;
  Future<List<BooksDataBookItems>?>? future;
  Map<String, dynamic> params = {};
  Future<List<BooksDataBookItems>?> getData(Map<String, dynamic>? p) async {
    Map<String, dynamic> newParams = Map.from(params);
    if (p != null) {
      p.keys.forEach((key) {
        newParams[key] = p[key];
      });

      if (p.containsKey('page')) {
        page = int.parse('${p['page']}');
      }
    }

    newParams['page'] = page;

    try {
      var ret = await widget.getData(newParams);
      params = newParams;
      isLoading = false;

      hasMore = ret?.hasNextPage ?? false;
      var newBooks = ret?.data ?? [];
      books ??= [];
      for (var item in newBooks) {
        books!.add(item);
      }

      return books;
    } catch (e) {
      print('获取失败');
      print(e);
      isLoading = false;
      return null;
    }
  }

  bool hasMore = true;
  bool isLoading = false;

  @override
  initState() {
    params = widget.defaultParams;
    super.initState();
    future = getData(null);
    postFrame(() {
      widget.controller?.addListener(_onScroll);
    });
  }

  @override
  void didUpdateWidget(covariant LoadBooks oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == null) {
      widget.controller?.addListener(_onScroll);
    }
  }

  @override
  dispose() {
    // widget.controller?.dispose();
    super.dispose();
  }

  reset(Map<String, dynamic>? params) {
    page = 1;
    books = null;
    isLoading = true;
    future = getData(params);
    setState(() {});
  }

  _onScroll() {
    if (widget.controller == null) {
      return;
    }

    var nextPageTrigger = widget.controller!.position.maxScrollExtent;
    if (widget.controller!.position.pixels + widget.buff > nextPageTrigger) {
      if (hasMore && !isLoading) {
        isLoading = true;
        page = page + 1;
        future = getData(null);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFutureBuilder(
      future: future,
      builder: (BuildContext context,
          AsyncSnapshot<List<BooksDataBookItems>?> snapshot) {
        if (snapshot.connectionState != ConnectionState.done &&
            this.books == null) {
          return const Loading();
        }

        if (snapshot.hasError) {
          return const Text('error');
        }

        var books = snapshot.data ?? [];
        if (books.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/noResult@2x.png',
                  width: 62,
                  height: 74,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    '没有符合条件的结果',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 107, 109, 122),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        var childAspectRatio = 1 / 2.25;

        return GridView.count(
          // primary: false,
          shrinkWrap: true,
          controller: widget.controller,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
          childAspectRatio: childAspectRatio,
          children: books.map((item) {
            return BookItem(
              name: item.name!,
              coverKey: item.coverKey!,
              id: item.id!,
              author:
                  item.authors!.isEmpty ? '' : item.authors?[0]?['name'] ?? '',
            );
          }).toList(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
