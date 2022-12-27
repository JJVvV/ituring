import 'package:flutter/material.dart';

class TokenInfo {
  String? accessToken;
  bool? isMobilePhoneConfirmed;
  String? refreshToken;
  int? userId;

  TokenInfo({
    this.accessToken,
    this.isMobilePhoneConfirmed,
    this.refreshToken,
    this.userId,
  });

  TokenInfo.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    isMobilePhoneConfirmed = json['isMobilePhoneConfirmed'];
    refreshToken = json['refreshToken'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['isMobilePhoneConfirmed'] = this.isMobilePhoneConfirmed;
    data['refreshToken'] = this.refreshToken;
    data['userId'] = this.userId;
    return data;
  }
}

class AuthState extends InheritedWidget {
  AuthState({
    Key? key,
    required super.child,
  }) : super(key: key);
  bool inited = false;

  TokenInfo? tokenInfo;
  setTokenInfo(TokenInfo? token) {
    tokenInfo = token;
    inited = true;
  }

  bool isInited() {
    return inited;
  }

  bool isAuth() {
    return isInited() && tokenInfo != null;
  }

  @override
  bool updateShouldNotify(AuthState oldWidget) {
    return oldWidget.tokenInfo != tokenInfo;
  }

  static AuthState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthState>()!;
  }
}
