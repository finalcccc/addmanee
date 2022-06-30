// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';

import '../../notifire/categoryNotifire.dart';

Delete_supp(SupplierNotifire supp) {
  FirebaseFirestore.instance
      .collection('suppliers')
      .doc(supp.CurrentSupplier!.id)
      .delete().then((value) {
    supp.RefreshSupplier();
  });
}
