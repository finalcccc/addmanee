// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../model/Employee_Model.dart';

class EmployeeNotifire with ChangeNotifier {
  List<EmployeeData> employee = [];
  EmployeeData? CurrentEmployee;
  EmployeeData? CurrentEmployee_loco;
  UnmodifiableListView<EmployeeData> get employeeList =>
      UnmodifiableListView(employee);
  RefreshEmp() {
    employee;
    CurrentEmployee_loco;
    notifyListeners();
  }
  getCurrentEmployee() {
    CurrentEmployee;

    print(CurrentEmployee?.name);
    notifyListeners();
  }
}
