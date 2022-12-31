import 'package:flutter/material.dart';
import 'package:ituring/component/animated_future_builder.dart';
import 'package:ituring/component/my.dart';
import 'package:ituring/http/repository/my.dart';
import 'package:ituring/http/repository/profile_data_entity.dart';

import '../component/loading.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<My> with AutomaticKeepAliveClientMixin<My> {
  Future<ProfileDataEntity?> getData() async {
    try {
      var res = await MyRepository.getProfile();
      return res;
    } catch (e) {
      return null;
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
              SliverAppBar(
                backgroundColor: Colors.white,
                titleSpacing: 0,
                stretch: false,
                pinned: true,
                // collapsedHeight: 30,
                title: const Center(
                  child: Text(
                    '我的',
                    style: TextStyle(color: Colors.black),
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
          body: AnimatedFutureBuilder(
              future: getData(),
              builder: (BuildContext context,
                  AsyncSnapshot<ProfileDataEntity?> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Loading();
                }

                if (snapshot.hasError) {
                  return const Text('error');
                }

                var profile = snapshot.data;
                if (profile == null) {
                  return SizedBox();
                }
                return MyWidget(data: profile);
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
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 90,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 20),
              child: Image.network(cover, width: 90, height: 120),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                name,
                maxLines: 2,
                softWrap: true,
                style: const TextStyle(
                  color: Color.fromARGB(255, 36, 39, 51),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (author.isNotEmpty)
              Text(
                author,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color.fromARGB(255, 107, 109, 122),
                  fontSize: 14,
                ),
              )
          ],
        ),
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
