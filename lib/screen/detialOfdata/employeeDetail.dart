import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewEmployee.dart';

class EmployeeDetail extends StatefulWidget {
  const EmployeeDetail({Key? key}) : super(key: key);

  @override
  State<EmployeeDetail> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຂໍ້ມູນລາຍລະອຽດຂອງແຕ່ລະຄົນ "),
        centerTitle: true,
        leading: element().RoutePageBack(context, const ViewEmployee()),
        backgroundColor: element.main,
      ),
    );
  }
}
