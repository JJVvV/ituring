import 'package:flutter/material.dart';
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
  // Future<List<BooksDataBookItems>?>? future;
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
      hasError = false;
      hasMore = ret?.hasNextPage ?? false;
      var newBooks = ret?.data ?? [];

      books ??= [];

      for (var item in newBooks) {
        books!.add(item);
      }
    } catch (e) {
      print('获取失败');
      print(e);
      isLoading = false;
      hasError = true;
    }
    setState(() {});
  }

  bool hasMore = true;
  bool isLoading = true;
  bool hasError = false;

  @override
  initState() {
    params = widget.defaultParams;
    super.initState();
    getData(null);
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
    getData(params);
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
        getData(null);
      }
    }
  }

  Future<void> _onRefresh() async {
    page = 1;
    books = null;
    // isLoading = true;
    getData(null);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: render(),
    );
  }

  Widget render() {
    Widget child;
    if (isLoading && books == null) {
      child = const Loading();
    } else if (hasError) {
      child = const Text('error');
    } else if (books == null) {
      child = const SizedBox();
    } else {
      var childAspectRatio = 1 / 2.25;
      var children = books!.map((item) {
        return BookItem(
          name: item.name!,
          coverKey: item.coverKey!,
          id: item.id!,
          author: item.authors!.isEmpty ? '' : item.authors?[0]?['name'] ?? '',
        );
      }).toList();
      child = GridView.count(
        // primary: false,
        shrinkWrap: true,
        controller: widget.controller,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
        childAspectRatio: childAspectRatio,
        children: children,
      );
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
