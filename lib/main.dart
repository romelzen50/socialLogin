import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_login_test/src/app.dart';

void main() {
  KakaoSdk.init(nativeAppKey: "f1eb0e8d6a8bee12f87ca60a0d160cf7");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Try Social Login',
      home: App(),
    );
  }
}
