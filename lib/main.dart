import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/aip_getdata.dart';
import 'package:untitled1/notifire/product_notifire.dart';
import 'package:untitled1/screen/manageOrder.dart';
import 'package:untitled1/screen/product_add/category.dart';
import 'package:untitled1/screen/receiveOrder.dart';
import 'package:untitled1/screen/product_add/appProduct.dart';
import 'package:untitled1/route/router.dart';
import 'package:untitled1/screen/supplier_add.dart';
import 'screen/registerEmployee.dart';
import 'screen/splashScreen .dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print('connect'),);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>categorynotifiere()),
    ],
    child: MyApp() ,)


  );
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
        route.register: (BuildContext context) => const EmployeeTapbar(),
        route.product: (BuildContext context) => const ProductAddTapbar(),
        route.m_orders: (BuildContext context) => const ManageOrder(),
        route.suppliyer: (BuildContext context) => const SupplierTapbar(),
        route.product_type: (BuildContext context) => const ProductTypeTapbar(),
      },
    );
  }
}
