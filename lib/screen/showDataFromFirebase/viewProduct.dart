import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/productNotifire.dart';
import 'package:untitled1/screen/detialOfdata/productDetail.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    ProductNotifire product = Provider.of<ProductNotifire>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍລະອຽດຂອງສິນຄ້າ'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: product.Products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.production_quantity_limits_sharp),
              title: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductDetail(),
                      ),
                    );
                  },
                  child: Text('${product.Products[index].nameProduct}')),
              subtitle: Image.network('${product.Products[index].image}'),
              trailing: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
