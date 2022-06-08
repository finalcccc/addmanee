import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../model/CartdetailData.dart';

class purchase_order_Notifire with ChangeNotifier{
  List<CartModelupload> Order_addmin =[];
  CartModelupload?Currenorderaddmin;
  List<CartModel>Dettil=[];
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

}