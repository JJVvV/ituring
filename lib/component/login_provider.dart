import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ituring/component/auth.dart';
import 'package:ituring/component/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends StatefulWidget {
  Widget child;
  LoginProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginProviderState();
  }
}

class _LoginProviderState extends State<LoginProvider> {
  @override
  void initState() {
    super.initState();
  }

  getToken() async {
    AuthState auth = AuthState.of(context);
    var perfs = await SharedPreferences.getInstance();
    var tokenString = perfs.getString('token');
    if (tokenString != null) {
      var tokenInfo = TokenInfo.fromJson(jsonDecode(tokenString));
      auth.setTokenInfo(tokenInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getToken(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Loading();
        }
        AuthState auth = AuthState.of(context);
        if (!auth.isAuth()) {
          Future.delayed(Duration.zero, () {
            Navigator.of(context).pushReplacementNamed(
              '/login',
            );
          });
          return const Loading();
        }
        return widget.child;
      },
    );
  }
}
