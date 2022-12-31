import 'package:flutter/material.dart';
import 'package:ituring/component/background_line.dart';
import 'package:ituring/component/my_icon.dart';
import 'package:ituring/http/repository/profile_data_entity.dart';

class MyWidget extends StatelessWidget {
  MyWidget({Key? key, required this.data}) : super(key: key);
  final ProfileDataEntity data;
  final List<MyItemData> userInfoItems = [
    MyItemData(label: '拥有的书', icon: MyIcons.ownBook, url: '/user/owe-book'),
    MyItemData(label: '已购买的课程', icon: MyIcons.ownLesson, url: '/user/owe-book'),
    MyItemData(label: '我的订单', icon: MyIcons.order, url: '/user/order'),
  ];
  final List<MyItemData> userFavItems = [
    MyItemData(label: '收藏夹', icon: MyIcons.collection, url: '/user/owe-book'),
    MyItemData(label: '我的银子', icon: MyIcons.me10, url: '/user/owe-book'),
  ];

  final List<MyItemData> userInfo2Items = [
    MyItemData(label: '个人设置', icon: MyIcons.setting, url: '/user/owe-book'),
    MyItemData(label: '修改密码', icon: MyIcons.password, url: '/user/owe-book'),
    MyItemData(label: '地址管理', icon: MyIcons.address, url: '/user/order'),
  ];

  @override
  Widget build(BuildContext context) {
    if (data.spaceInfo == null) {
      return const Text('asdf');
    }
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          MyHeader(data: data),
          const BackgroundLine(),
          MyItems(data: userInfoItems),
          const BackgroundLine(),
          MyItems(data: userFavItems),
          const BackgroundLine(),
          MyItems(data: userInfo2Items),
        ],
      ),
    );
  }
}

class MyItems extends StatelessWidget {
  const MyItems({Key? key, required this.data}) : super(key: key);

  final List<MyItemData> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ...data.asMap().entries.map((e) {
            var index = e.key;
            var value = e.value;
            return Material(
              child: InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  print('');
                },
                child: Ink(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: index != data.length - 1
                          ? const Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 227, 229, 232),
                                  width: 0.5),
                            )
                          : null,
                    ),
                    height: 54,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          value.icon,
                          color: const Color.fromARGB(255, 200, 205, 212),
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            value.label,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProfileDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 25),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://file.ituring.com.cn/LargeCover/${data.spaceInfo!.avatarImageKey}')),
                borderRadius: const BorderRadius.all(
                  Radius.circular(99),
                ),
                boxShadow: [
                  // 0 8px 12px -4px rgb(0 0 0 / 7%), 0 6px 6px -4px rgb(0 0 0 / 8%)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    spreadRadius: -4,
                    blurRadius: 12,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: -4,
                    blurRadius: 6,
                    offset: const Offset(0, 6), // changes position of shadow
                  ),
                ],
                // color: Colors.redAccent,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.nickName ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '社区年龄 / ${data.spaceInfo?.age ?? 0}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 107, 109, 122),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyItemData {
  MyItemData({required this.label, required this.icon, required this.url});
  final IconData icon;
  final String url;
  final String label;
}
