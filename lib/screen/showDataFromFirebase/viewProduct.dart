import 'package:flutter/material.dart';
import 'package:untitled1/screen/detialOfdata/productDetail.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  final List<String> items =
      List<String>.generate(20, (index) => "items: {++index}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Product'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
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
                  child: const Text('name of product')),
              subtitle: const Text('id Product'),
              trailing: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
