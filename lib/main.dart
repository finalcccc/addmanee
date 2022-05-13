import 'package:flutter/material.dart';
import 'package:untitled1/mainpage/cart.dart';
import 'package:untitled1/mainpage/m_order.dart';
import 'package:untitled1/mainpage/peoduct.dart';
import 'package:untitled1/model/menou.dart';
import 'package:untitled1/mainpage/profile.dart';
import 'package:untitled1/mainpage/win_orders.dart';
import 'package:untitled1/celement/router.dart';
import 'package:untitled1/model/screen.dart';

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
      home: splatscreen(),
      routes: <String, WidgetBuilder>{
        rout.prodc: (BuildContext context) => new veiwproduct(),
        rout.profl: (BuildContext context) => new profile(),
        rout.win_order: (BuildContext context) => new win_dorders(),
        rout.m_orders: (BuildContext context) => new m_order(),
        rout.charts: (BuildContext context) => new cart(),
      },
    );
  }
}
