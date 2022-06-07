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
    return AlertDialog(
      actions: [
        Card(
          child: Stack(
            children: [
              Image.network('${cart.cartproduct!.Product!.image}'),
            ],
          ),
        )
      ],

    );}}