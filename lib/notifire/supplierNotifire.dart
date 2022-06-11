// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../model/supplier_data.dart';

class SupplierNotifire with ChangeNotifier {
   List<String> Suplierid = [];
   String? SuppType;
  List<SupplierData> Supplier = [];
  SupplierData? CurrentSupplier;

  UnmodifiableListView<SupplierData> get SuplierList =>
      UnmodifiableListView(Supplier);

  RefreshSupplier() {
    Supplier;
    notifyListeners();
  }

  getCurrentSupplier() {
    CurrentSupplier;
    notifyListeners();
  }
  SelectType(String? v) {
    SuppType = v;
    notifyListeners();
  }
}
