import 'dart:math';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/model/category.dart';
import 'package:untitled1/model/product_data.dart';
import '../notifire/product_notifire.dart';

getProduct_data(categorynotifiere cate) async {
  int i = 0;
  List<category_data> category = [];
  QuerySnapshot<Map<String, dynamic>> rfn =
      await FirebaseFirestore.instance.collection('categorys').get();
  rfn.docs.forEach((e) {
    category_data f = category_data.frommap(e.data());
    category.add(f);
    i++;
  });
   cate.category=category;

}
