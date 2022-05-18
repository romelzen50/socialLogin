import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_login_test/src/google_login.dart';

void main() {
  KakaoSdk.init(nativeAppKey: "f1eb0e8d6a8bee12f87ca60a0d160cf7");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KakaoLogin',
      home: GoogleLogin(),
    );
  }
}

// class Main extends StatefulWidget {
//   @override
//   _MainState createState() => _MainState();
// }

// class _MainState extends State<Main> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         minimum: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const KakaoLogin(),
//             const SizedBox(height: 10),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: 
//               CupertinoButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const GoogleLogin(),
//                     ),
//                   );
//                 },
//                 color: Colors.lightBlue,
//                 child: const Text(
//                   '구글 로그인',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: CupertinoButton(
//                 onPressed: () {},
//                 color: Colors.black87,
//                 child: const Text(
//                   '애플 로그인',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: CupertinoButton(
//                 onPressed: () {},
//                 color: Colors.redAccent,
//                 child: const Text(
//                   '패스 본인인증',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
