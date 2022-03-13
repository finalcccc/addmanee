import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';

class veiwproduct extends StatefulWidget {
  const veiwproduct({Key? key}) : super(key: key);

  @override
  State<veiwproduct> createState() => _veiwproductState();
}

class _veiwproductState extends State<veiwproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       leading: element.backpage(context
       ),
     ),
    );
  }
}
