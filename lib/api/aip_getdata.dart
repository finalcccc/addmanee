<<<<<<< HEAD
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
=======
// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/category.dart';

GetCategorydata() async {
  catagory_data cate = catagory_data();
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection("categorys").get();
  querySnapshot.docs.forEach((element) {
    catagory_data j = catagory_data.frommap(element.data());
    print('${j.category}\n${j.id}');
>>>>>>> 629c0d81c2f32575034f0fc6bc752dbeca5cfcdf
  });
   cate.category=category;

}
