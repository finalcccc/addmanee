import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/product_data.dart';

import '../model/employee_data.dart';

class ProductNotifire with ChangeNotifier {
  List<ProductData> Product= [];
   ProductData? CurrenProduct;
  UnmodifiableListView<ProductData> get Products=> UnmodifiableListView(Product);
  RefreshProduct() {
    Product;
    notifyListeners();
  }

  getCurrenProduct() {
    CurrenProduct;

    print(CurrenProduct?.nameProduct);
    notifyListeners();
  }

}