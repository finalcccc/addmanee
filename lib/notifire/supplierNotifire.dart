
import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../model/supplier_data.dart';

class SupplierNotifire with ChangeNotifier {
  List<SupplierData> Supplier = [];
  List<String> Supplierlist = [];
  String? SuppType;
  UnmodifiableListView<SupplierData> get SupplierList => UnmodifiableListView(Supplier);

  RefreshCategory() {
    Supplier;
    notifyListeners();
  }

  SelectType(String? v) {
    SuppType = v;
    notifyListeners();
  }
}