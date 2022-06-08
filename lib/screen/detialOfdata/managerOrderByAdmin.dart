import 'package:flutter/material.dart';
import 'package:untitled1/screen/manageOrder.dart';
import 'package:untitled1/celement/elements.dart';
class ManagerOrderByAdmin extends StatefulWidget {
  const ManagerOrderByAdmin({Key? key}) : super(key: key);

  @override
  State<ManagerOrderByAdmin> createState() => _ManagerOrderByAdminState();
}

class _ManagerOrderByAdminState extends State<ManagerOrderByAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຊື້ສິນຄ້າຈາກຜູ້ສະໜອງ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ManageOrder()),
      ),
      body: const Card(
        child: Text('ແອັບມິນສັ່ງຊື້ຈາກຜູ້ສະໜອງ'),
      ),
    );
  }
}
