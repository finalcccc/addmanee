import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled1/model/product_data.dart';

import '../model/CartdetailData.dart';

class Cartnotifire with ChangeNotifier{
  List<CartDetailData> Carts =[];
  ProductData? Procartcart;
  int amoultoal =0;
  UnmodifiableListView<CartDetailData>get Cartlist => UnmodifiableListView(Carts);


  cecks(){
    amoultoal++;
  Carts.add(CartDetailData(Procartcart, 1));
  notifyListeners();
  }
  remove(index){
     amoultoal -= Carts[index].amout;
     Carts.removeAt(index);
  notifyListeners();
   }
   sum(index){
     amoultoal++;
     Carts[index].amout++;
     notifyListeners();
   }
   dedet(index){
     if( Carts[index].amout >1){
       amoultoal--;
       Carts[index].amout--;

     }

     notifyListeners();

   }
}