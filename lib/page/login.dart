import 'dart:convert' as Convert;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ituring/component/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../component/loading.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login>
    with AutomaticKeepAliveClientMixin<Login> {
  Future<void> getData() async {
    // try {
    //   var response = await LoginRepository.getLogin();
    //   List<dynamic> list = response['blockContents'];
    //   return list.where((item) {
    //     return item['tagType'] == 0;
    //   }).toList();
    // } catch (e) {
    //   return [];
    // }
  }

  late WebViewController webController;

  @override
  initState() {
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            // _onShowUserAgent();
            _injectLoginJavascript();
            print('onPageStarted: $url');
          },
          onPageFinished: (String url) {
            print('onPageFinished: $url');
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print('onPageFinished: $request.url');
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'LoginChannel',
        onMessageReceived: (JavaScriptMessage message) async {
          AuthState auth = AuthState.of(context);
          auth.setTokenInfo(
            TokenInfo.fromJson(Convert.jsonDecode(message.message)),
          );
          var prefs = await SharedPreferences.getInstance();
          prefs.setString('token', message.message);

          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text('${auth.tokenInfo?.userId}')),
          // );
          Navigator.pushReplacementNamed(
            context,
            '/',
          );
        },
      )
      ..loadRequest(Uri.parse('https://m.ituring.com.cn/login'));
    super.initState();
    // getData();
  }

  Future<void> _injectLoginJavascript() {
    return webController.runJavaScript(
      '''
      const send = XMLHttpRequest.prototype.send;
      XMLHttpRequest.prototype.send = function(data) {
        const xml = this;
        this.addEventListener('readystatechange', function() {
          if (xml.readyState == 4) {
            const responseText = xml.responseText;
            if(xml.responseURL.indexOf('/Account/Token') > -1){
              LoginChannel.postMessage(responseText);
            }
          }
        }, false);

        send.apply(this, arguments);
      }

      ''',
    );
  }

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
              SliverAppBar(
                backgroundColor: Colors.white,
                titleSpacing: 0,
                stretch: false,
                pinned: true,
                // collapsedHeight: 30,
                title: const Center(
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                toolbarHeight: 50,
                // expandedHeight: 20,
                forceElevated: innerBoxIsScrolled,
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 107, 109, 122),
                ),
              ),
            ];
          },
          body: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Loading();
              }
              if (snapshot.hasError) {
                return const Text('error');
              }
              return Container(
                color: Colors.white,
                child: WebViewWidget(
                  controller: webController,
                  gestureRecognizers: Set()
                    ..add(
                      Factory(() => EagerGestureRecognizer()),
                    ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
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
    required this.onTap,
    required this.label,
  }) : super(key: key);
  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
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
      ),
    );
  }
}
