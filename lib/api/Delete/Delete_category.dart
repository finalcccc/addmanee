// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/api/getCategoryData.dart';

import '../../notifire/categoryNotifire.dart';

Delete_Category(CategoryNotifire cate) async {
  FirebaseFirestore.instance
      .collection('categorys')
      .doc(cate.CurrentCategory!.id)
      .delete().then((value) async{
    await GetCategoryData(cate);
        cate.RefreshCategory();

  });
}
