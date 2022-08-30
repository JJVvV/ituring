import 'package:flutter/material.dart';
import 'package:ituring/page/books.dart';

import '../my_icon.dart';
import 'home.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1.0,
  );

  int pageIndex = 0;

  Widget renderBottomBar() {
    if (pageIndex >= 2) {
      return SizedBox();
    }
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Color.fromARGB(255, 227, 229, 232)))),
      child: BottomBar(
        currentIndex: pageIndex,
        items: const [
          BottomBarItem(icon: MyIcons.home, label: '首页'),
          BottomBarItem(icon: MyIcons.book, label: '图书'),
          BottomBarItem(icon: MyIcons.cart, label: '购物车'),
          BottomBarItem(icon: MyIcons.my, label: '我的'),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: renderBottomBar(),
      body: IndexPageViewState(
        currentPage: pageIndex,
        setCurrentPage: (page) {
          _onItemTapped(page);
          setState(() {
            pageIndex = page;
          });
        },
        enterCart: () {
          setState(() {
            pageIndex = 2;
          });
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 248, 248),
          ),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            controller: _pageController,
            children: const [
              Home(),
              Books(),
              Text('cart'),
              Text('asdf page3'),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    // _selectedIndex.value = index;
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    setState(() {
      pageIndex = index;
    });
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  final List<BottomBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items.map((item) {
        final isSelected = items.indexOf(item) == currentIndex;
        final Color iconColor = isSelected
            ? const Color.fromARGB(255, 44, 89, 183)
            : const Color.fromARGB(255, 200, 205, 212);
        final textColor = isSelected
            ? const Color.fromARGB(255, 44, 89, 183)
            : const Color.fromARGB(255, 107, 109, 122);
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: iconColor, size: 24),
                Text(
                  item.label,
                  style: TextStyle(color: textColor, fontSize: 12),
                )
              ],
            ),
          ),
          onTap: () {
            onTap?.call(items.indexOf(item));
          },
        );
      }).toList(),
    );
  }
}

class BottomBarItem {
  const BottomBarItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

class IndexPageViewState extends InheritedWidget {
  const IndexPageViewState({
    Key? key,
    required super.child,
    required this.currentPage,
    required this.setCurrentPage,
    required this.enterCart,
  }) : super(key: key);
  final int currentPage;
  final Function(int page) setCurrentPage;
  final Function() enterCart;

  @override
  bool updateShouldNotify(IndexPageViewState oldWidget) {
    return oldWidget.currentPage != currentPage;
  }

  static IndexPageViewState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IndexPageViewState>()!;
  }
}
