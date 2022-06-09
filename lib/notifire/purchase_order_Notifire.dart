import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/product_data.dart';

import '../model/CartdetailData.dart';

class purchase_order_Notifire with ChangeNotifier{
  List<CartModelupload> Order_addmin =[];
  CartModelupload?Currenorderaddmin;
  ProductData?Productaddmin;
  List<CartModel>Dettil=[];
  List<ProductData> Productditill =[];
  UnmodifiableListView<CartModelupload> get Order_addminlist=>UnmodifiableListView(Order_addmin);

  Refreshorderaddmin(){
    Order_addmin;
    Dettil;
    notifyListeners();
  }
  Curren(){

    Currenorderaddmin;
    notifyListeners();
  }
 Refresh(){
   Productditill;
   notifyListeners();
 }
}