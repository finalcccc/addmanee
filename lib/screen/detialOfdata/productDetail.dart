// ignore_for_file: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/productNotifire.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewProduct.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    ProductNotifire product = Provider.of<ProductNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍລະອຽດຂອງສິນຄ້າ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ViewProduct()),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                '${product.CurrentProduct!.image}',
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ລະຫັດສິນຄ້າ:' + ' ${product.CurrentProduct!.id}'),
                    Text(
                        'ປະເພດສິນຄ້າ:' + ' ${product.CurrentProduct!.category_id}'),
                    Text('ຊື່ສິນຄ້າ:' +
                        ' ${product.CurrentProduct!.nameProduct}'),
                    Text('ຈຳນວນສິນຄ້າ:' +
                        ' ${product.CurrentProduct!.amount}' +
                        ' ແພັກ'),
                    Text('ລາຄາຂາຍ:' + ' ${product.CurrentProduct!.price}'),
                    Text('ລາຍລະອຽດ: ' +
                        ' ${product.CurrentProduct!.description}'),
                  ],
                ),
              ),
              const SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
