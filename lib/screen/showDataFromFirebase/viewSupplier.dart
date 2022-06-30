// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/WidgetSearch/widgetSearch.dart';
import 'package:untitled1/api/getsupplier.dart';
import 'package:untitled1/dialog/dialog_and_snackbar.dart';
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
  void initState() {
    super.initState();
    dos();
  }

  Future dos() async {
    SupplierNotifire supp =
        Provider.of<SupplierNotifire>(context, listen: false);
    await GetSupplier(supp);
  }

  @override
  Widget build(BuildContext context) {
    SupplierNotifire Supp = Provider.of<SupplierNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: element.main,
        centerTitle: true,
        title: const Text(
          'ຂໍ້ມູນຜູ້ສະໜອງ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນຜູ້ສະໜອງ"),
        leading: element().RoutePageBack(context, const SupplierTapbar()),
      ),
      body: ListView.builder(
        itemCount: Supp.SuplierList.length,
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
            child: ListTile(
              leading: const Icon(
                Icons.people,
                size: 35,
                color: Colors.black,
              ),
              title: Row(
                children: [
                  const Text(
                    'ຊື່:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(' ${Supp.SuplierList[index].name}'),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ອີເມວ: ${Supp.SuplierList[index].email}'),
                  Text('ເບີໂທ:' ' ${Supp.SuplierList[index].tel}'),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  Supp.CurrentSupplier = Supp.SuplierList[index];
                  Dialog_D(context, name: Supp.CurrentSupplier!.name, typefuction: 'supplier',notifire: Supp);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
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
