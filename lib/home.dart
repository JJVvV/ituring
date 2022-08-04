import 'package:flutter/material.dart';
import 'package:ituring/http/repository/home.dart';

import 'my_icon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<dynamic>? blockContents;

  Future<void> getData() async {
    try {
      var response = await HomeRepository.getHome();
      print(response['blockContents']);
      List<dynamic> list = response['blockContents'];
      setState(() {
        blockContents = list.where((item) {
          return item['tagType'] == 0;
        }).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  // List list = [
  //   {"name": 'Linux1命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux2命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux3命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux4命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux5命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux6命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  //   {"name": 'Linux命令行与shell脚本编程大全（第4版）', "author": 'Al Sweigart'},
  // ];

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
                title: Header(),
                toolbarHeight: 123,
              ),
            ];
          },
          body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            itemCount: 3,
            itemBuilder: (context, idx) {
              if (blockContents == null) {
                return Text('loading');
              }

              Map block = blockContents![idx];
              List books = block['tag']['bookItems'];
              return Section(
                title: block['name'],
                onMore: () {
                  print('onmore');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 230,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: books.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map item = books[index];
                            return GestureDetector(
                              onTap: () {
                                print(item);
                              },
                              child: Book(
                                name: item['name'],
                                cover:
                                    "https://file.ituring.com.cn/SmallCover/${item['coverKey']}",
                                author: item['authors'].isEmpty
                                    ? ''
                                    : item['authors'][0]['name'],
                              ),
                            );
                          },
                        ))
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
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

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        right: 15,
        bottom: 15.5,
        left: 15,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 44, 89, 183),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/logo@2x.png',
                width: 180,
                height: 36,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        MyIcons.cart,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        MyIcons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Tag(label: '前端'),
                    Tag(label: '后端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                    Tag(label: '前端'),
                  ],
                ),
              ),
            ),
          )
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
    print(cover);
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
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
