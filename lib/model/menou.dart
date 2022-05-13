
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/celement/router.dart';

class menou extends StatefulWidget {
  const menou({Key? key}) : super(key: key);

  @override
  State<menou> createState() => _menouState();
}

class _menouState extends State<menou> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: element.main,
        shadowColor: Colors.grey[300],
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            element.titall,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [element.cartbuton(context, rout.charts)],
      ),
      drawer: buildDrawer(),
      body: Container(
        color: Colors.grey[300],
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
          children: [
            element.butn(
                context, rout.prodc, Icons.shop, element.main, element.p1),
            element.butn(
                context, rout.profl, Icons.airplay, element.Indigo, element.p2),
            element.butn(
                context, rout.m_orders, Icons.border_color, element.ocean, element.p3),
            element.butn(
                context, rout.win_order, Icons.article_rounded, element.sky, element.p4),
            element.butn(
                context, rout.prodc, Icons.shop, element.main, element.p1),
            element.butn(
                context, rout.profl, Icons.airplay, element.Indigo, element.p2),

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

          buildListTile(element.p1, rout.prodc),
          buildListTile(element.p2, rout.profl),
          buildListTile(element.p3, rout.m_orders),
          buildListTile(element.p4, rout.win_order),

        ],
      ),
    );
  }

  ListTile buildListTile(txt, rout) {
    return ListTile(
        title: Text(txt),
        onTap: () {
          Navigator.pushNamed(context, rout);
        });
  }
}
