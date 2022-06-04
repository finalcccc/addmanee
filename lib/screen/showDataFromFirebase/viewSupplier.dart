
import 'package:flutter/material.dart';

import '../detialOfdata/supplierDetail.dart';

class ViewSupplier extends StatefulWidget {
  const ViewSupplier({Key? key}) : super(key: key);

  @override
  State<ViewSupplier> createState() => _ViewSupplierState();
}

class _ViewSupplierState extends State<ViewSupplier> {
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
          return  Card(
            child: ListTile(
              leading: const Icon(Icons.people),
              title: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupplierDetail(),
                      ),
                    );
                  },
                  child: const Text('name of product')),
              subtitle: const Text('id'),
              trailing: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
