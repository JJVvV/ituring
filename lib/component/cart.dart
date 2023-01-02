import 'package:flutter/material.dart';
import 'package:ituring/component/check.dart';
import 'package:ituring/component/my_icon.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.avatar,
    required this.checked,
    required this.name,
    required this.type,
    required this.price,
    required this.quantity,
    this.onTap,
    this.onMinus,
    this.onPlus,
  }) : super(key: key);

  final String avatar;
  final bool checked;
  final String? name;
  final int? type;
  final double? price;
  final int? quantity;
  void Function()? onTap;
  void Function()? onMinus;
  void Function()? onPlus;

  String? get bookType {
    if (type == 0) {
      return '电子书';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Check(
                checked: checked,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(right: 15),
              width: 70,
              height: 95,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    // 4px 4px 14px 0 rgb(0 0 0 / 7%), 2px 2px 6px 0 rgb(0 0 0 / 8%)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      spreadRadius: 0,
                      blurRadius: 14,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.network(
                  avatar,
                  width: 70,
                  height: 95,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? '',
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 36, 39, 58),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      bookType ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 107, 109, 122),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          price != null ? '$price' : '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 36, 39, 58),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (onMinus != null) {
                                  onMinus!();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 200, 205, 212),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                ),
                                child: const Icon(
                                  MyIcons.minus,
                                  size: 9,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 38,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 200, 205, 212),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(2),
                                ),
                              ),
                              child: Text(
                                '$quantity',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 36, 39, 58),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (onPlus != null) {
                                  onPlus!();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 200, 205, 212),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                ),
                                child: const Icon(
                                  MyIcons.plus,
                                  size: 9,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartFooter extends StatelessWidget {
  final num total;
  final bool checked;
  final void Function(bool checked) onCheck;
  final void Function() onSubmit;
  const CartFooter({
    Key? key,
    required this.total,
    required this.checked,
    required this.onCheck,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              onCheck(!checked);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 12, bottom: 12),
                    child: Check(checked: checked),
                  ),
                  const Text(
                    '全选',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 107, 109, 122),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: RichText(
                    text: TextSpan(children: [
                      const WidgetSpan(
                        child: Text(
                          '合计：',
                          style: TextStyle(
                            color: Color.fromARGB(255, 36, 39, 58),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          '${total} 元',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 36, 39, 58),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onSubmit();
                  },
                  child: Ink(
                    color: const Color.fromARGB(255, 44, 89, 183),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            '结算',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
