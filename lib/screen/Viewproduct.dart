import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/api/aip.dart';
import 'package:untitled1/notifire/product_notifire.dart';

class Viewproduct extends StatefulWidget {
  const Viewproduct({Key? key}) : super(key: key);

  @override
  State<Viewproduct> createState() => _ViewproductState();
}

class _ViewproductState extends State<Viewproduct> {


  @override
  void initState() {

    //product_notifire Productnotifier = Provider.of<product_notifire>(context, listen: true);
  // getproduct();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // product_notifire Productnotifier = Provider.of<product_notifire>(context);
    return Scaffold(
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Text( 'hj');
              },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.black,
                );
              },
              itemCount: 12)),
    );
  }
}
