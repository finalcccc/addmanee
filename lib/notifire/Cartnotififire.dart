import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled1/model/product_data.dart';

import '../model/CartdetailData.dart';

class Cartnotifire with ChangeNotifier{
  List<CartDetailData> Carts =[];
  ProductData? Procartcart;
  UnmodifiableListView<CartDetailData>get Cartlist => UnmodifiableListView(Carts);


  cecks(){
  Carts.add(CartDetailData(Procartcart, 1));
  notifyListeners();
  }
  remove(index){
     Carts.removeAt(index);
  notifyListeners();
   }
   sum(index){

     Carts[index].amout++;
     notifyListeners();
   }
   dedet(index){
     if( Carts[index].amout >1){
       Carts[index].amout--;
     }

     notifyListeners();

   }
}