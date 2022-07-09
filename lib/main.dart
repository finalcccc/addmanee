// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/common/purchase__Cart.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';
import 'package:untitled1/notifire/OrderNotifire.dart';
import 'package:untitled1/notifire/Repport_Notifire.dart';
import 'package:untitled1/notifire/categoryNotifire.dart';
import 'package:untitled1/notifire/employeeNotifire.dart';
import 'package:untitled1/notifire/import_product.dart';
import 'package:untitled1/notifire/purchase_order_Notifire.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';
import 'package:untitled1/screen/detialOfdata/managerOrderByAdmin.dart';
import 'package:untitled1/screen/manageOrder.dart';
import 'package:untitled1/screen/product_add/category.dart';
import 'package:untitled1/report/buttonReportData.dart';
import 'package:untitled1/common/Product_for_purchase_.dart';
import 'package:untitled1/screen/product_add/appProduct.dart';
import 'package:untitled1/route/router.dart';
import 'package:untitled1/screen/product_add/supplier_add.dart';
import 'notifire/productNotifire.dart';
import 'screen/detialOfdata/managerOrderByAdmin.dart';
import 'screen/product_add/registerEmployee.dart';
import 'screen/splashScreen .dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => print('connect'),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CategoryNotifire()),
      ChangeNotifierProvider(create: (_) => EmployeeNotifire()),
      ChangeNotifierProvider(create: (_) => ProductNotifire()),
      ChangeNotifierProvider(create: (_) => SupplierNotifire()),
      ChangeNotifierProvider(create: (_) => Cartnotifire()),
      ChangeNotifierProvider(create: (_) => purchase_order_Notifire()),
      ChangeNotifierProvider(create: (_) => importproductNotifire()),
      ChangeNotifierProvider(create: (_) => Order_Notifire()),
      ChangeNotifierProvider(create: (_) => report_incomeNotifire()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        route.prodc: (BuildContext context) => const ViweProducts_Addmin(),
        route.register: (BuildContext context) => const EmployeeTapbar(),
        route.product: (BuildContext context) => const ProductAddTapbar(),
        route.m_orders: (BuildContext context) => const ManageOrder(),
        route.suppliyer: (BuildContext context) => const SupplierTapbar(),
        route.product_type: (BuildContext context) => const ProductTypeTapbar(),
        route.reportData: (BuildContext context) => const ReportData(),
        route.MnagerOrderByAdmin: (BuildContext context) =>
            const ManagerOrderByAdmin(),
        route.Cart: (BuildContext context) => const Cart(),
      },
    );
  }
}
