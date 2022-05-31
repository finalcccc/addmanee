import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/celement/router.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: element.main,
        shadowColor: Colors.grey[300],
        iconTheme: const IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            element.titall,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [element.cartbuton(context, route.charts)],
      ),
      drawer: buildDrawer(),
      body: Container(
        color: Colors.grey[300],
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
          children: [
            element.butn(
                context, route.prodc, Icons.shop, element.main, element.p1),
            element.butn(context, route.register, Icons.airplay, element.Indigo,
                element.p2),
            element.butn(context, route.m_orders, Icons.border_color,
                element.ocean, element.p3),
            element.butn(context, route.product, Icons.article_rounded,
                element.sky, element.p4),
            element.butn(context, route.suppliyer, Icons.article_rounded,
                element.sky, element.p5),
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
          buildListTile(element.p1, route.prodc),
          buildListTile(element.p2, route.register),
          buildListTile(element.p3, route.m_orders),
          buildListTile(element.p4, route.product),
          buildListTile(element.p5, route.suppliyer),
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