import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/product_data.dart';

class Productnotifiere with ChangeNotifier {

 List<Product_data>product=[];
 Product_data? curanProduct;
 UnmodifiableListView<Product_data> get  productlist =>UnmodifiableListView(product);
  Product(List<Product_data>?productlists){
    product  = productlists??[];
    notifyListeners();
  }

}
