// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:untitled1/model/category.dart';
import '../notifire/categoryNotifire.dart';

GetCategoryData(CategoryNotifire cate) async {
  List<CategoryData> category = [];
  QuerySnapshot<Map<String, dynamic>> rfn =
      await FirebaseFirestore.instance.collection('categorys').orderBy('category').get();
  cate.cate.clear();
  rfn.docs.forEach((e) {
    CategoryData f = CategoryData.frommap(e.data());
    cate.cate.add(e['category']);
    category.add(f);
  });
  cate.category = category;
  cate.cate.clear();
}
