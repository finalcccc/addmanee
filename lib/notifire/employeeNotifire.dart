// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../model/employee_data.dart';

class EmployeeNotifire with ChangeNotifier {
  List<EmployeeData> employee = [];
  EmployeeData? CurrentEmployee;
  UnmodifiableListView<EmployeeData> get employeeList =>
      UnmodifiableListView(employee);
  RefreshEmp() {
    employee;
    notifyListeners();
  }
  getCurrentEmployee() {
    CurrentEmployee;

    print(CurrentEmployee?.name);
    notifyListeners();
  }
}
