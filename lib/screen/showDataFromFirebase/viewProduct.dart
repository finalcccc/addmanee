// ignore_for_file: prefer_if_null_operators, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/productNotifire.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/screen/product_add/appProduct.dart';

import '../../WidgetSearch/widgetSearch.dart';
import '../detialOfdata/productDetail.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    ProductNotifire product =
        Provider.of<ProductNotifire>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: element.main,
        centerTitle: true,
        title: const Text(
          'ລາຍການສິນຄ້າ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນລາຍການສິນຄ້າ"),
        leading: element().RoutePageBack(context, const ProductAddTapbar()),
      ),
      body: ListView.builder(
          itemCount: product.Products.length,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: (){
                    product.CurrentProduct = product.Products[index];
                    product.getCurrentProduct();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductDetail(),
                      ),
                    );

                },
                child: Container(
                  child: Card(

                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              '${product.Products[index].image != null ? product.Products[index].image : element.nullimage}',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  'ຊື່ສິນຄ້າ: ' +
                                      ' ${product.Products[index].nameProduct}',
                                  style: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('ຈຳນວນສິນຄ້າ: ' +
                                    ' ${product.Products[index].amount} ' +
                                    ' ແພັກ'),
                                trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                ),
                              ),

                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
