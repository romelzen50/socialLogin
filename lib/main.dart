import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  KakaoSdk.init(nativeAppKey: "f1eb0e8d6a8bee12f87ca60a0d160cf7");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KakaoLogin',
      home: KakaoLoginPage(),
    );
  }
}

class KakaoLoginPage extends StatefulWidget {
  @override
  _KakaoLoginPageState createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  bool _isInstalled = true;

  _initKaKaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    setState(() {
      _isInstalled = installed;
    });
  }

  @override
  void initState() {
    super.initState();
    _initKaKaoTalkInstalled();
  }

  void loginButtonClicked() async {
    try {
      final authCode = _isInstalled
          ? await AuthCodeClient.instance.requestWithTalk()
          : await AuthCodeClient.instance.request(); // via browser
      // String authCode = await AuthCodeClient.instance.requestWithTalk() // or with KakaoTalk
      var token = await AuthApi.instance.issueAccessToken(authCode: '');

      var tokenManager = DefaultTokenManager();

      tokenManager.setToken(token);
      // Store access token in TokenManager for future API requests.
    } catch (e) {
      // some error happened during the course of user login... deal with it.
    }
  }

  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
  }
  // Future<void> _loginWithKakaoApp() async {
  //   try {
  //     var code = await AuthCodeClient.instance.requestWithTalk();
  //     await _issueAccessToken(code);
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }
  //   Future<void> _loginWithWeb() async {
  //   try {
  //     var code = await AuthCodeClient.instance.request();
  //     await _issueAccessToken(code);
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }
  // Future<void> _issueAccessToken(String authCode) async {
  //   try {
  //     var token = await AuthApi.instance.issueAccessToken(authCode: '');
  //     AccessTokenStore.instance.toStore(token);
  //     final kakaoUrl = Uri.parse('[토큰 전달할 URL]');
  //     http
  //     .post(kakaoUrl, body: json.encode({'access_token': token}))
  //     .then((res) => print(json.decode(res.body)))
  //     .catchError((e) => print(e.toString()));
  //     Navigator.pushNamed(context, '/');
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: _loginButtonPressed,
                color: Colors.yellow,
                child: Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
