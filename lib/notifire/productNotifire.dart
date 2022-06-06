// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/product_data.dart';

class ProductNotifire with ChangeNotifier {
  List<ProductData> Product = [];
  ProductData? CurrentProduct;
  UnmodifiableListView<ProductData> get Products =>
      UnmodifiableListView(Product);
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
