// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 5),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13.0, bottom: 20),
              child: Column(
                children: [
                  element.backpage(context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 105, top: 20),
              child: TextField(
                  decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                labelText: "Search Products:",
                border: MyinputBorder(),
                enabledBorder: MyinputBorder(),
                focusedBorder: MyfocusBorder(),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 315.0, right: 10, top: 20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: element.main,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "ຄົ້ນຫາ",
                      style: TextStyle(
                          color: element.wht,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder MyinputBorder() {
  //return type is OutlineInputBorder
  return const OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 3,
      ));
}

OutlineInputBorder MyfocusBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: Colors.greenAccent,
      width: 3,
    ),
  );
}
