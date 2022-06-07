import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled1/model/product_data.dart';

import '../model/CartdetailData.dart';

class Cartnotifire with ChangeNotifier{
  List<CartDetailData> Carts =[];
  CartDetailData?cartproduct;
  UnmodifiableListView<CartDetailData>get Cartlist => UnmodifiableListView(Carts);
}