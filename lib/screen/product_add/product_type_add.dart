import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';

class product_type extends StatefulWidget {
  const product_type({Key? key}) : super(key: key);

  @override
  State<product_type> createState() => _product_typeState();
}

class _product_typeState extends State<product_type> {
  GlobalKey<FormState> Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: element.main,
        leading: element.BackPage(context),
        title: Text(element.p6),
      ),
      body: SingleChildScrollView(
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
    );
  }
}
