// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/getEmployeeData.dart';
import 'package:untitled1/notifire/employeeNotifire.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({Key? key}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    EmployeeNotifire employee = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewEmployee'),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: dos,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${employee.employeeList[index]}'),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
              );
            },
            itemCount: employee.employeeList.length),
      ),
    );
  }

  Future dos() async {
    EmployeeNotifire employee =
        Provider.of<EmployeeNotifire>(context, listen: false);
    await GetEmployeeData(employee);
    Provider.of<EmployeeNotifire>(context, listen: false).RefreshCategory();
  }
}
