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
  });
}
