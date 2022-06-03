import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/api/aip.dart';
import 'package:untitled1/api/getCategoryData.dart';
import 'package:untitled1/model/category.dart';
import 'package:untitled1/notifire/product_notifire.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override

  CategoryData  cate = CategoryData();

  @override
  Widget build(BuildContext context) {
  // Productnotifiere product = Provider.of<Productnotifiere>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
    child: FloatingActionButton(
    backgroundColor: Colors.amberAccent,
    onPressed: ()async {

    },
    child: Icon(
    Icons.train,
    size: 35,
    color: Colors.black,
    ),
    ),),);
  }
}
