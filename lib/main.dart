import 'package:flutter/material.dart';
import 'package:untitled1/mainpage/cart.dart';
import 'package:untitled1/mainpage/m_order.dart';
import 'package:untitled1/mainpage/peoduct.dart';
import 'package:untitled1/mainpage/win_orders.dart';
import 'package:untitled1/celement/router.dart';
import 'package:untitled1/model/screen.dart';

import 'login_and_singup/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const splatscreen(),
      routes: <String, WidgetBuilder>{
        rout.prodc: (BuildContext context) => const veiwproduct(),
        rout.register: (BuildContext context) => const Register(),
        rout.win_order: (BuildContext context) => const win_dorders(),
        rout.m_orders: (BuildContext context) => const m_order(),
        rout.charts: (BuildContext context) => const cart(),
      },
    );
  }
}
