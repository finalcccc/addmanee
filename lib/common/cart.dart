// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Cartnotifire cart = Provider.of<Cartnotifire>(context);
    return Scaffold(
         body:Column(
           children: [
             Expanded(
               child: ListView.builder(
                 itemCount: cart.Cartlist.length,
                 itemBuilder: (context, index) {
                 return Text('${cart.Cartlist[index].Product!.nameProduct}');
               },),
             )
           ],
         ),

    ) ;}}