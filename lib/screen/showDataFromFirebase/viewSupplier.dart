// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screen/product_add/supplier_add.dart';

import '../../celement/elements.dart';
import '../../notifire/supplierNotifire.dart';
import '../detialOfdata/supplierDetail.dart';

class ViewSupplier extends StatefulWidget {
  const ViewSupplier({Key? key}) : super(key: key);

  @override
  State<ViewSupplier> createState() => _ViewSupplierState();
}

class _ViewSupplierState extends State<ViewSupplier> {
  @override
  Widget build(BuildContext context) {
    SupplierNotifire Supp = Provider.of<SupplierNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນຜູ້ສະໜອງ'),
        centerTitle: true,
        leading: element().RoutePageBack(context, const Supplier()),
      ),
      body: ListView.builder(
        itemCount: Supp.SuplierList.length,
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
            child: ListTile(
              leading: const Icon(Icons.people,size: 35,),
              title: Text( 'ຊື່ ແລະ ນາມສະກຸນ:'  ' ${Supp.SuplierList[index].name}'),
              subtitle:
                  Text('ເບີໂທ:' ' ${Supp.SuplierList[index].tel}'),
              onTap: () {
                Supp.CurrentSupplier = Supp.SuplierList[index];
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupplierDetail(),
                  ),
                );
              },
            ),
          ));
        },
      ),
    );
  }
}
