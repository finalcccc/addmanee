// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewSupplier.dart';

import '../../celement/elements.dart';

class SupplierDetail extends StatefulWidget {
  const SupplierDetail({Key? key}) : super(key: key);

  @override
  State<SupplierDetail> createState() => _SupplierDetailState();
}

class _SupplierDetailState extends State<SupplierDetail> {
  @override
  Widget build(BuildContext context) {
    SupplierNotifire supplier = Provider.of<SupplierNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນລາຍລະອຽດຂອງແຕ່ລະຄົນ'),
        centerTitle: true,
        leading: element().RoutePageBack(context, const ViewSupplier()),
        backgroundColor: element.main,
      ),
      body: Card(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ອີແມວ: ' + ' ${supplier.CurrentSupplier!.email}'),
            Text('ລະຫັດ: ' + ' ${supplier.CurrentSupplier!.id}'),
            Text('ຊື່ ແລະ ນາມສະກຸນ :' + ' ${supplier.CurrentSupplier!.name}'),
            Text('ເບີໂທ: ' + ' ${supplier.CurrentSupplier!.tel}'),
            Text('ທີ່ຢູ່: ' + ' ${supplier.CurrentSupplier!.address}'),
            Text('ວັນທີ ເດືອນ ປີ :' + ' ${supplier.CurrentSupplier!.date}'),
            const SizedBox(height: 440),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
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
      )),
    );
  }
}
