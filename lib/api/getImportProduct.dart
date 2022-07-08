import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';

import '../model/purchase_order_Model.dart';
import '../model/supplier_data.dart';

getImPortProduct(SupplierNotifire importProduct) async {
  importProduct.Supplier.clear();
  importProduct.ImportProduct.clear();
  QuerySnapshot<Map<String, dynamic>> rfn =
      await FirebaseFirestore.instance.collection('purchase_order').get();
  rfn.docs.forEach((element) async {
    print(element.data().length);

    CartModelupload cartModelupload = CartModelupload.formMap(element.data());
    importProduct.ImportProduct.add(cartModelupload);
    QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
        .collection('suppliers')
        .where('id', isEqualTo: cartModelupload.Supplier_ID)
        .get();
    rfn.docs.forEach((element) async {
      print(element.data().length);
      QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
          .collection('importproducts')
          .where('id_purchase', isEqualTo: cartModelupload.id)
          .get();
      SupplierData supplier = SupplierData.fromMap(element.data());
      importProduct.Supplier.add(supplier);
      importProduct.RefreshSupplier();
    });
  });
}
