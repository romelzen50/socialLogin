import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_login_test/src/pages/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(' Firebase load fail'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const Home();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}