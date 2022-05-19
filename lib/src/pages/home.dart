import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_login_test/src/pages/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return const Login();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data?.displayName}님 반갑습니다."),
                  TextButton(
                    child: const Text("로그아웃"),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

//SafeArea(
      //   minimum: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const KakaoLogin(),
      //       const SizedBox(height: 10),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         child: CupertinoButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => const GoogleLogin(),
      //               ),
      //             );
      //           },
      //           color: Colors.lightBlue,
      //           child: const Text(
      //             '구글 로그인',
      //             style: TextStyle(
      //               fontSize: 20,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         child: CupertinoButton(
      //           onPressed: () {},
      //           color: Colors.black87,
      //           child: const Text(
      //             '애플 로그인',
      //             style: TextStyle(
      //               fontSize: 20,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         child: CupertinoButton(
      //           onPressed: () {},
      //           color: Colors.redAccent,
      //           child: const Text(
      //             '패스 본인인증',
      //             style: TextStyle(
      //               fontSize: 20,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //     ],
      //   ),
      // ),