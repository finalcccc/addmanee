// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/product_Model.dart';

import '../model/category_Model.dart';

class ProductNotifire with ChangeNotifier {
  List<product_Model> Product = [];
  product_Model? CurrentProduct;
  UnmodifiableListView<product_Model> get Products => UnmodifiableListView(Product);
  RefreshProduct() {
    Product;
    notifyListeners();
  }

  getCurrentProduct() {
    CurrentProduct;

    print(CurrentProduct?.nameProduct);
    notifyListeners();
  }
}
