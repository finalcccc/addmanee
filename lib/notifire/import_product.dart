import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:untitled1/model/importproducts_Model.dart';

class importproductNotifire with ChangeNotifier{
  List<import_products>impt_productlisl=[];
  import_products?impt_product;
  UnmodifiableListView<import_products>get impt_productsList => UnmodifiableListView(impt_productlisl);

  Refresh(){
    impt_product;
    print('impt_product!.id_products');
    notifyListeners();

  }




}