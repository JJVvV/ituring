import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ituring/component/cart.dart';
import 'package:ituring/component/loading.dart';
import 'package:ituring/http/repository/cart.dart';
import 'package:ituring/http/repository/cart_data_entity.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CartState();
  }
}

class CartState extends State<Cart> {
  bool isLoading = true;
  bool hasError = false;
  List<CartDataInvalidCartItems>? data;
  Future<void> getData() async {
    try {
      var res = await CartRepository.getCart();
      data = res?.invalidCartItems ?? [];
    } catch (e) {
      hasError = true;
      // return null;
    }
    isLoading = false;
    setState(() {});
  }

  Set<int> checkedSet = {};

  Widget renderBody(BuildContext context) {
    Widget child;
    if (isLoading) {
      child = const Loading();
    } else if (hasError) {
      child = const Text('error');
    } else if (data == null) {
      child = const SizedBox();
    } else {
      child = MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          itemExtent: 130,
          children: (data ?? []).map((item) {
            return CartItem(
              avatar: 'https://file.ituring.com.cn/SmallCover/${item.cover}',
              checked: checkedSet.contains(item.bookId!),
              name: item.bookName,
              price: item.price,
              type: item.bookSaleType,
              quantity: item.quantity,
              onTap: () {
                var checked = checkedSet.contains(item.bookId!);
                var newChecked = !checked;
                if (newChecked) {
                  checkedSet.add(item.bookId!);
                } else {
                  checkedSet.remove(item.bookId!);
                }
                setState(() {});
              },
              onMinus: () {
                if (item.quantity == null) {
                  return;
                }
                if (item.quantity! <= 1) {
                  return;
                }
                if (item.bookSaleType == 0) {
                  return;
                }
                print('${item.bookName} minus');
              },
              onPlus: () {
                if (item.bookSaleType == 0) {
                  Fluttertoast.showToast(
                    msg: "电子书不能修改数量",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    // backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 14.0,
                  );
                  return;
                }
                print('${item.bookName} plus');
              },
            );
          }).toList(),
        ),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }

  num get total {
    if (data == null) {
      return 0;
    }
    num t = 0;
    for (int i = 0; i < data!.length; i++) {
      var item = data![i];
      if (checkedSet.contains(item.bookId!)) {
        t += data![i].price ?? 0;
      }
    }

    return t;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
          // floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                titleSpacing: 0,
                title: const Center(
                  child: Text(
                    '购物车',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                toolbarHeight: 50,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: renderBody(context)),
      bottomNavigationBar: isLoading
          ? const SizedBox(
              height: 51,
            )
          : CartFooter(
              total: total,
              checked: data != null && checkedSet.length == data!.length,
              onCheck: (checked) {
                if (checked) {
                  checkedSet.clear();
                  var ids = data!.map((item) => item.bookId!);
                  checkedSet.addAll(ids);
                } else {
                  checkedSet.clear();
                }
                setState(() {});
              },
              onSubmit: () {
                if (checkedSet.isEmpty) {
                  return;
                }
                Fluttertoast.showToast(
                  msg: "此应用仅用于学习，如需购买，请移步至官网",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  // backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
}
