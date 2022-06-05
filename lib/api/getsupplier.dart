import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/category.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:untitled1/model/category.dart';
import 'package:untitled1/model/supplier_data.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';
import '../notifire/categoryNotifire.dart';

GetSupplier(SupplierNotifire supp) async {
  List<SupplierData> _supplier = [];
  QuerySnapshot<Map<String, dynamic>> rfn =
  await FirebaseFirestore.instance.collection('categorys').orderBy('category').get();
  supp.Supplierlist.clear();
  rfn.docs.forEach((e) {
    SupplierData f = SupplierData.fromMap(e.data());
    supp.Supplierlist.add(e['category']);
    _supplier.add(f);
  });
  supp.Supplier = _supplier;
  supp.RefreshSupplier();
}
