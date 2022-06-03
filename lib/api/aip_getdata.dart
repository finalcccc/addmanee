

import 'dart:math';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/model/category.dart';
import 'package:untitled1/model/product_data.dart';

getProduct_data()async{
 catagory_data cate = catagory_data();
  QuerySnapshot<Map<String ,dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("categorys").get();
  querySnapshot.docs.forEach((element) {
   catagory_data j = catagory_data.frommap(element.data());
   print(j.category);
  });
}
