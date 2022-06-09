import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/notifire/import_product.dart';

Upload_import_product(importproductNotifire importproduct)async{
  CollectionReference reference = await FirebaseFirestore.instance.collection('importproducts');
  reference.add(importproduct.impt_product!.toMap());

}