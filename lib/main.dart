import 'package:flutter/material.dart';
import 'package:untitled1/mainpage/manageOrder.dart';
import 'package:untitled1/mainpage/receiveOrder.dart';
import 'package:untitled1/mainpage/appProduct.dart';
import 'package:untitled1/celement/router.dart';
import 'package:untitled1/mainpage/supplyer.dart';
import 'screen/register.dart';
import 'screen/splashScreen .dart';

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
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        route.prodc: (BuildContext context) => const ReceiveOrder(),
        route.register: (BuildContext context) => const Register(),
        route.product: (BuildContext context) => const AddProduct(),
        route.m_orders: (BuildContext context) => const ManageOrder(),
        route.suppliyer: (BuildContext context) => const Suppliyer(),
      },
    );
  }
}
