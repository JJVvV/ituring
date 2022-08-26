import 'package:flutter/material.dart';

import 'home.dart';
import 'my_icon.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
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
              setState(() {
                pageIndex = index;
              });
            },
          )),
      body: Container(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 248, 248),
          ),
          child: PageView(
            onPageChanged: (index) {
              _selectedIndex.value = index;
            },
            controller: _pageController,
            children: const [
              Home(),
              Text('asdf page1'),
              Text('cart'),
              Text('asdf page3'),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
    _pageController.jumpToPage(
      index,
    );
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
