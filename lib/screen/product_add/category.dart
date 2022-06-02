import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/screen/product_add/appProduct.dart';

class product_type_tapbar extends StatefulWidget {
  const product_type_tapbar({Key? key}) : super(key: key);

  @override
  State<product_type_tapbar> createState() => _product_type_tapbarState();
}

class _product_type_tapbarState extends State<product_type_tapbar> {

  @override
  Widget build(BuildContext context) {
    return element().tabbarpage(label1: 'v',icos1: Icons.feed,icos2: Icons.feed ,label2: 'g',tap1: catagory(),tap2: AddProduct());
  }
}

class catagory extends StatefulWidget {
  const catagory({Key? key}) : super(key: key);

  @override
  State<catagory> createState() => _catagoryState();
}

class _catagoryState extends State<catagory> {
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
