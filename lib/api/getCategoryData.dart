// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:untitled1/model/category.dart';
import '../notifire/product_notifire.dart';

GetCategoryData(categorynotifiere cate) async {
  int i = 0;
  List<CategoryData> category = [];
  QuerySnapshot<Map<String, dynamic>> rfn =
      await FirebaseFirestore.instance.collection('categorys').get();
  rfn.docs.forEach((e) {
    CategoryData f = CategoryData.frommap(e.data());
    category.add(f);
    i++;
  });
  cate.category = category;
}
