import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled1/model/product_data.dart';

import '../model/CartdetailData.dart';

class Cartnotifire with ChangeNotifier{
  List<CartDetailData> Carts =[];
  ProductData? Procartcart;
  UnmodifiableListView<CartDetailData>get Cartlist => UnmodifiableListView(Carts);


   getdata(){

   }
  cecks(){
  Carts.add(CartDetailData(Procartcart, 1));
  }
}