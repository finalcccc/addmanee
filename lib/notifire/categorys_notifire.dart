import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/api/getCategoryData.dart';
import 'package:untitled1/model/category.dart';
import 'package:untitled1/model/product_data.dart';

class categorynotifiere with ChangeNotifier {
  List<CategoryData> category = [];
  List<String> cate =[];
  String? categorytype;
  UnmodifiableListView<CategoryData> get categorylist => UnmodifiableListView(category);

  RefreshCategory() {
    category;
    notifyListeners();
  }
  SelcetType(String? v){
     categorytype = v;
     notifyListeners();
  }
}
