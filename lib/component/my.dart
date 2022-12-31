import 'package:flutter/material.dart';
import 'package:ituring/http/repository/profile_data_entity.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required this.data}) : super(key: key);
  final ProfileDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Text('${data.nickName}');
  }
}
