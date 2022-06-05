
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifire/supplierNotifire.dart';
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
    SupplierNotifire Supp = Provider.of<SupplierNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍລະອຽດຂອງຜູ້ສະໜອງ'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Supp.SupplierList.length,
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
                  child: Text('${Supp.SupplierList[index].name}')),
              subtitle:  Text('${Supp.SupplierList[index].date?.toDate().toString()}'),
              trailing: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
