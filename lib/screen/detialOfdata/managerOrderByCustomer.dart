import 'package:flutter/material.dart';
import 'package:untitled1/screen/manageOrder.dart';
import 'package:untitled1/celement/elements.dart';
class ManagerOrderByCustomer extends StatefulWidget {
  const ManagerOrderByCustomer({Key? key}) : super(key: key);

  @override
  State<ManagerOrderByCustomer> createState() => _ManagerOrderByCustomerState();
}

class _ManagerOrderByCustomerState extends State<ManagerOrderByCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລູກຄ້າສັ່ງຊື້ສິນຄ້າ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ManageOrder()),
      ),
      body: const Card(
        child: Text('ສັ່ງຊື້ຈາກລູກຄ້າ'),
      ),
    );
  }
}
