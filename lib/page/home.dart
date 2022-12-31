import 'package:flutter/material.dart';
import 'package:ituring/component/animated_future_builder.dart';
import 'package:ituring/generated/json/book_home_data_entity.g.dart';

import '../component/book.dart';
import '../component/header.dart';
import '../component/loading.dart';
import '../http/repository/home.dart';
import 'tag_detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  Future<List<dynamic>> getData() async {
    try {
      var response = await HomeRepository.getHome();
      List<dynamic> list = response['blockContents'];
      return list.where((item) {
        return item['tagType'] == 0;
      }).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  initState() {
    super.initState();
    // getData();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                backgroundColor: Color.fromARGB(255, 44, 89, 183),
                titleSpacing: 0,
                stretch: true,
                pinned: false,
                title: Header(
                  child: IndexHeader(),
                ),
                toolbarHeight: 110,
              ),
            ];
          },
          body: AnimatedFutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Loading();
                }
                if (snapshot.hasError) {
                  return const Text('error');
                }
                var blockContents = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  itemCount: 3,
                  itemBuilder: (context, idx) {
                    if (blockContents == null || blockContents.isEmpty) {
                      return const SizedBox();
                    }

                    var blockJson = blockContents[idx];
                    var block = $BookHomeDataBlockContentsFromJson(blockJson);
                    var books = block.tag?.bookItems ?? [];
                    return Section(
                      title: block.name!,
                      onMore: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: books.isEmpty ? 25 : 230,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              itemCount: books.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = books[index];
                                return GestureDetector(
                                  onTap: () {
                                    // print(item);
                                  },
                                  child: BookItem(
                                      name: item.name!,
                                      coverKey: item.coverKey!,
                                      id: item.id!,
                                      author: item.authors!.isEmpty
                                          ? ''
                                          : item.authors?[0]['name'] ?? ''),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }),
        )
      ],
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

class Tag extends StatelessWidget {
  const Tag({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);
  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 29, 70, 157),
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        margin: const EdgeInsets.only(right: 5),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(137, 255, 255, 255),
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
  Future<List<Map<String, String>>> getData() async {
    try {
      return await HomeRepository.getTags();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FutureBuilder<List<Map<String, String>>>(
        future: getData(),
        initialData: [],
        builder: (context, snapshot) {
          return SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: snapshot.data!.map((item) {
                return Tag(
                    label: item['name'] ?? '',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/tag',
                        arguments: TagScreenArguments(
                          item['id']!,
                          item['name']!,
                        ),
                      );
                    });
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
