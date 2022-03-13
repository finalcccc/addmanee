
import 'package:flutter/material.dart';
import 'package:untitled1/mainpage/cart.dart';
import 'package:untitled1/mainpage/m_order.dart';
import 'package:untitled1/mainpage/peoduct.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/mainpage/profile.dart';
import 'package:untitled1/mainpage/win_orders.dart';
import 'package:untitled1/mainpage/win_orders.dart';
import 'package:untitled1/celement/router.dart';

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
      theme: ThemeData(
      ),
      home: MyHomePage(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final divider = Divider(
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: element.main,
        shadowColor: Colors.grey[300],
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(element.titall ,style: TextStyle(fontWeight: FontWeight.bold),),

        ),
        actions: [
          element.cartbuton(context, rout.charts)
        ],
      ),
      drawer: buildDrawer(),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.only(top: 40),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
          children: [
            element.butn(context, rout.prodc, Icons.shop, element.main,element.p1),
            element.butn(context, rout.profl, Icons.airplay, element.Indigo,element.p2),
            element.butn(context, rout.m_orders, Icons.border_color, element.ocean,element.p3),
            element.butn(context, rout.win_order, Icons.article_rounded, element.sky,element.p4),
          ],
        ),
      ),
    );
  }




   Widget buildDrawer() {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff0031CA),
            ),
            //Title of header
            child: Text(
              'ທະວິສັກ',
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
          divider,
          buildListTile(element.p1,rout.prodc),
          divider,
          buildListTile(element.p2,rout.profl),
          divider,
          buildListTile(element.p3,rout.m_orders),
          divider,
          buildListTile(element.p4,rout.win_order),
          divider,
        ],
      ),

    );
  }

   ListTile buildListTile(txt,rout) {
     return ListTile(
          title: Text(txt),
          onTap: () {
            Navigator.pushNamed(context,rout);
          }
        );
   }
}
