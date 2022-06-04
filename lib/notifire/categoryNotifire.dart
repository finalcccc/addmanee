// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/category.dart';

class EmployeeNotifire with ChangeNotifier {
  List<CategoryData> category = [];
  List<String> cate = [];
  String? categoryType;
  UnmodifiableListView<CategoryData> get categoryList =>
      UnmodifiableListView(category);

  RefreshCategory() {
    category;
    notifyListeners();
  }

  SelectType(String? v) {
    categoryType = v;
    notifyListeners();
  }
}
