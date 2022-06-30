// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/notifire/productNotifire.dart';

import '../../notifire/categoryNotifire.dart';

Delete_products(ProductNotifire pro) {
  FirebaseFirestore.instance
      .collection('products')
      .doc(pro.CurrentProduct!.id)
      .delete().then((value) {
    FirebaseStorage.instance.refFromURL(pro.CurrentProduct!.image.toString()).delete();
    pro.RefreshProduct();
  });
}
