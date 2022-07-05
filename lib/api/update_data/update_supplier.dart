import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';

import '../getsupplier.dart';

Update_supplier(SupplierNotifire supp) {
  FirebaseFirestore.instance
      .collection('suppliers')
      .doc(supp.CurrentSupplier!.id)
      .update(supp.CurrentSupplier!.toMap()).then((value) async{
    await GetSupplier(supp);
    supp.RefreshSupplier();
  });
}