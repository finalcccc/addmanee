import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນລາຍລະອຽດຂອງແຕ່ລະຄົນ'),
        centerTitle: true,
        leading: element().RoutePageBack(context, const ViewSupplier()),
        backgroundColor: element.main,
      ),
    );
  }
}
