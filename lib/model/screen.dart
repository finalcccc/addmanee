import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/login_and_singup/login.dart';
import 'dart:async';

class SplatScreen extends StatefulWidget {
  const SplatScreen({Key? key}) : super(key: key);

  @override
  State<SplatScreen> createState() => SplatScreenState();
}

class SplatScreenState extends State<SplatScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => const login(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'ຮ້ານເເອັດມານີ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
