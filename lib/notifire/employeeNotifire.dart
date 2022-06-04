// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../model/employee_data.dart';

class EmployeeNotifire with ChangeNotifier {
  List<EmployeeData> employee = [];
  UnmodifiableListView<EmployeeData> get employeeList => UnmodifiableListView(employee);
  RefreshEmp() {
    employee;
    notifyListeners();
  }

}
