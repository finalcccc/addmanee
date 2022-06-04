// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/employee_data.dart';
import '../notifire/employeeNotifire.dart';

GetEmployeeData(EmployeeNotifire emp) async {
  List<EmployeeData> employee = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('employees')
      .orderBy('employee')
      .get();
  rfn.docs.forEach(
    (e) {
      EmployeeData f = EmployeeData.frommap(e.data());
      employee.add(f);
    },
  );
  emp.employee = employee;
}
