// ignore_for_file: sized_box_for_whitespace, avoid_print, non_constant_identifier_names, avoid_unnecessary_containers, prefer_if_null_operators

import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/categoryNotifire.dart';
import 'package:untitled1/notifire/productNotifire.dart';
import 'package:untitled1/screen/detialOfdata/productDetail.dart';

import '../api/getProduct.dart';

class ReceiveOrder extends StatefulWidget {
  const ReceiveOrder({Key? key}) : super(key: key);

  @override
  State<ReceiveOrder> createState() => _ReceiveOrderState();
}

class _ReceiveOrderState extends State<ReceiveOrder> {
  bool colortype = false;
  void colortypes() {
    setState(() {
      colortype;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductNotifire product = Provider.of<ProductNotifire>(context);
    CategoryNotifire category = Provider.of<CategoryNotifire>(context);
    return Scaffold(
      backgroundColor: element.gray,
      appBar: AppBar(
        leading: element.BackPage(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewCategoryAll(product),
            ViewCategory(category, product),
            ViewProducts(context, product),
          ],
        ),
      ),
    );
  }

  Padding ViewCategoryAll(ProductNotifire product) {
    return Padding(
      padding: const EdgeInsets.only(right: 260),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
            color: colortype == true ? element.main : Colors.blue,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            InkWell(
              child: Text(
                'ສີນຄ້າທັ້ງໝົດ',
                style: TextStyle(color: element.wht),
              ),
              onTap: () {
                GetProduct(product);
                colortypes();
                colortype = true;
              },
            ),
          ],
        ),
      ),
    );
  }

  Container ViewCategory(CategoryNotifire category, ProductNotifire product) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: category.categoryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              GetProduct_type(
                  product, category.categoryList[index].category, index);
              colortype = false;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: colortype != true ? element.main : Colors.blue),
              child: Row(
                children: [
                  Container(
                      child: Text('${category.categoryList[index].category}',
                          style: TextStyle(color: element.wht))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container ViewProducts(BuildContext context, ProductNotifire product) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.25,
      child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 4.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemCount: product.Products.length,
          itemBuilder: (BuildContext ctx, index) {
            return Content(product, index);
          }),
    );
  }

  Widget Content(ProductNotifire product, int index) {
    return Container(
        child: Card(
      elevation: 14,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.blue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: InkWell(
        onTap: () {
          print(product.Products[index].category);
          product.CurrentProduct = product.Products[index];
          product.getCurrentProduct();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProductDetail()));
        },
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '${product.Products[index].image != null ? product.Products[index].image : element.nullimage}',
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                    ))),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.Products[index].nameProduct}',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Divider(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    thickness: 1,
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ລາຄາ:  '),
                      Text(
                          '${NumberFormat.decimalPattern().format(product.Products[index].price)}  ກີບ'),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ຈຳນວນ:  '),
                      Text('${product.Products[index].amount}' '  ເເກັດ',
                          style: TextStyle(
                              color: product.Products[index].amount! <= 9
                                  ? Colors.red
                                  : Color(0xff0FAA4D))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
