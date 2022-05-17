import 'package:flutter/material.dart';
import 'package:untitled1/mainpage/m_order.dart';
import 'package:untitled1/mainpage/peoduct.dart';
import 'package:untitled1/mainpage/product.dart';
import 'package:untitled1/celement/router.dart';
import 'screen/register.dart';
import 'screen/screen.dart';

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
        route.product: (BuildContext context) => const Product(),
        route.m_orders: (BuildContext context) => const m_order(),
      },
    );
  }
}
