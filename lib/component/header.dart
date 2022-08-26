import 'package:flutter/material.dart';

import '../my_icon.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 0,
        right: 0,
        bottom: 15,
        left: 0,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
