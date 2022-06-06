// ignore_for_file: unused_local_variable, prefer_adjacent_string_concatenation

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/employeeNotifire.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewEmployee.dart';

class EmployeeDetail extends StatefulWidget {
  const EmployeeDetail({Key? key}) : super(key: key);

  @override
  State<EmployeeDetail> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  @override
  Widget build(BuildContext context) {
    EmployeeNotifire employee = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຂໍ້ມູນລາຍລະອຽດຂອງແຕ່ລະຄົນ "),
        centerTitle: true,
        leading: element().RoutePageBack(context, const ViewEmployee()),
        backgroundColor: element.main,
      ),
      body: Card(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ອີແມວ: ' + ' ${employee.CurrentEmployee!.email}'),
            Text('ລະຫັດ: ' + ' ${employee.CurrentEmployee!.password}'),
            Text('ຊື່ ແລະ ນາມສະກຸນ :' + ' ${employee.CurrentEmployee!.name}'),
            Text('ເບີໂທ: ' + ' ${employee.CurrentEmployee!.tel}'),
            Text('ທີ່ຢູ່: ' + ' ${employee.CurrentEmployee!.address}'),
            Text('ວັນທີ ເດືອນ ປີ :' + ' ${employee.CurrentEmployee!.date}'),
            Text('ຕຳແໜ່ງ: ' + '${employee.CurrentEmployee!.position}'),
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
