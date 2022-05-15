import 'package:flutter/material.dart';
import 'package:untitled1/common/cart.dart';
import 'package:untitled1/mainpage/m_order.dart';
import 'package:untitled1/mainpage/peoduct.dart';
import 'package:untitled1/mainpage/supplyer.dart';
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
      home: const SplatScreen(),
      routes: <String, WidgetBuilder>{
        route.prodc: (BuildContext context) => const veiwproduct(),
        route.register: (BuildContext context) => const Register(),
        route.win_order: (BuildContext context) => const win_dorders(),
        route.m_orders: (BuildContext context) => const m_order(),
        route.charts: (BuildContext context) => const Cart(),
        route.suppliyer: (BuildContext context) => const Suppliyer(),
      },
    );
  }
}
