import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/productNotifire.dart';

class ReceiveOrder extends StatefulWidget {
  const ReceiveOrder({Key? key}) : super(key: key);

  @override
  State<ReceiveOrder> createState() => _ReceiveOrderState();
}

class _ReceiveOrderState extends State<ReceiveOrder> {
  @override
  Widget build(BuildContext context) {
    ProductNotifire product = Provider.of<ProductNotifire>(context);
    return Scaffold(
      backgroundColor: element.gray,
      appBar: AppBar(
        leading: element.BackPage(context),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: InkWell(
        onTap: () {
          print(product.Products[index].category);
        },
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '${product.Products[index].image}',
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                    ))),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('${product.Products[index].nameProduct}',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                   Divider(
                      color: Colors.primaries[Random().nextInt(product.Products.length+1)],
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
                      Text('${product.Products[index].price}'),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ຈຳນວນ:  '),
                      Text('${product.Products[index].amount}',style: TextStyle(color: product.Products[index].amount! <= 9 ? Colors.red:Color(0xff0FAA4D))),
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
