// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/screen/product_add/appProduct.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewCategory.dart';

import '../../api/getCategoryData.dart';
import '../../notifire/product_notifire.dart';

class ProductTypeTapbar extends StatefulWidget {
  const ProductTypeTapbar({Key? key}) : super(key: key);

  @override
  State<ProductTypeTapbar> createState() => _ProductTypeTapbarState();
}

class _ProductTypeTapbarState extends State<ProductTypeTapbar> {

  @override
  Widget build(BuildContext context) {
    return element().TabbarPage(
        label1: 'v',
        icos1: Icons.feed,
        icos2: Icons.feed,
        label2: 'g',
        tap1: const Category(),
        tap2:  ViewCategory());
  }
}

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  void initState() {
    super.initState();
    dos();
  }
  Future dos()async{
    categorynotifiere category = Provider.of<categorynotifiere>(context,listen: false);
    await GetCategoryData(category);
  }
  GlobalKey<FormState> Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: element.main,
        leading: element.BackPage(context),
        title: Text(element.p6),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Form(
              key: Key,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  element().inputFields(
                      icons: Icons.category,
                      hint: 'ປະເພດສິນຄ້າ',
                      Keybordtye: TextInputType.text,
                      trye: 'Products_type',
                      context: context),
                  const SizedBox(height: 20),
                  element().elevatedButton(Key, 'addproduct_type'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
