// ignore_for_file: non_constant_identifier_names, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/getEmployeeData.dart';
import 'package:untitled1/notifire/employeeNotifire.dart';
import 'package:untitled1/screen/product_add/registerEmployee.dart';

import '../../celement/elements.dart';
import '../detialOfdata/employeeDetail.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({Key? key}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  @override
  void initState() {
    super.initState();
    dos();
  }

  Future dos() async {
    EmployeeNotifire emp =
        Provider.of<EmployeeNotifire>(context, listen: false);
    await GetEmployeeData(emp);
  }

  @override
  Widget build(BuildContext context) {
    EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນຂອງພະນັກງານແຕ່ລະຄົນ'),
        centerTitle: true,
        leading: element().RoutePageBack(context, const Register()),
        backgroundColor: element.main,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return CardEmployee(index, emp);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black,
            );
          },
          itemCount: emp.employeeList.length),
    );
  }

  Widget CardEmployee(int index, EmployeeNotifire employee) {
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(
                "ຊື່ ແລະ ນາມສະກຸນ: " + " ${employee.employeeList[index].name}"),
            subtitle:
                Text("ຕຳແໜ່ງ: " + " ${employee.employeeList[index].position}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('ແກ້ໄຂ'),
                onPressed: () {
                  employee.CurrentEmployee = employee.employeeList[index];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmployeeDetail(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('ລົບ'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
