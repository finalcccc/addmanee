// ignore_for_file: non_constant_identifier_names, prefer_adjacent_string_concatenation, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/getEmployeeData.dart';
import 'package:untitled1/notifire/employeeNotifire.dart';
import 'package:untitled1/screen/product_add/registerEmployee.dart';

import '../../WidgetSearch/widgetSearch.dart';
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
        backgroundColor: element.main,
        centerTitle: true,
        title: const Text(
          'ຂໍ້ມູນຂອງພະນັກງານແຕ່ລະຄົນ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນພະນັກງານ"),
        leading: element().RoutePageBack(context, const Register()),
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
      child: InkWell(
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     const Icon(Icons.people_alt_sharp),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Row(
        //           children: [
        //             Text(
        //               "ຊື່: ",
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.bold, fontSize: 15),
        //             ),
        //             Text(
        //               " ${employee.employeeList[index].name}",
        //               style: TextStyle(fontSize: 15),
        //             ),
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Text(
        //               "ຕຳແໜ່ງ: ",
        //               style: TextStyle(fontSize: 15),
        //             ),
        //             Text(
        //               " ${employee.employeeList[index].position}",
        //               style: TextStyle(fontSize: 15),
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //     Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const SizedBox(width: 8),
        //         TextButton(
        //           child: const Text('ລົບ'),
        //           onPressed: () {},
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        // onTap: () {
        //   employee.CurrentEmployee = employee.employeeList[index];
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) => const EmployeeDetail()));
        // },
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
              Text(' ${employee.employeeList[index].name}'),
            ],
          ),
          subtitle: Column(children: [
            Text('ຕຳແໜ່ງ:' ' ${employee.employeeList[index].position}'),
            Text('ລະຫັດ: ${employee.employeeList[index].id}')
          ],),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
        onTap: () {
          employee.CurrentEmployee = employee.employeeList[index];
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const EmployeeDetail()));
        },
      ),
    );
  }
}
