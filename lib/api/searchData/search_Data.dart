// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/category_Model.dart';
import 'package:untitled1/notifire/categoryNotifire.dart';
import '../../model/product_Model.dart';
import '../../notifire/productNotifire.dart';

Future SearchProduct(ProductNotifire pro,String values) async {
  List<product_Model>? _Product = [];
  List<product_Model> _f = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .where('nameProduct', isGreaterThanOrEqualTo: '${values}')
      .get();
  pro.Product.clear();
  rfn.docs.forEach((data) async {
    String nameProduct = data['nameProduct'].toString();
    if (nameProduct.trim() == values) {
      product_Model p = await product_Model.formMap(data.data());
      _f.add(p);
      pro.RefreshProduct();
    } else if (nameProduct[0] == values[0] && nameProduct[1] == values[1] || nameProduct[0] == values[0] || nameProduct[0] == [1]) {
      product_Model p = await product_Model.formMap(data.data());
      _Product.add(p);
    }
  });
  waitt(pro, _f, _Product);
}

Future waitt(ProductNotifire pro, _f, _Product) async {
  Future.delayed(Duration(seconds: 1), () {
    if (_f.length != 0) {
      print(_f.length);
      pro.Product = _f;
      pro.RefreshProduct();
    } else {
      pro.Product.clear();
      print(_Product.length);
      pro.Product = _Product;
      pro.RefreshProduct();
    }
  }).catchError((err) {});
}



Future Searchcategory(CategoryNotifire cate,String values) async {
  List<CategoryData>? _cate = [];
  List<CategoryData> _f = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('categorys')
      .where('category', isGreaterThanOrEqualTo: '${values}')
      .get();
  cate.category.clear();
  rfn.docs.forEach((data) async {
    String namecate = data['category'].toString();
    if (namecate.trim() == values) {
      CategoryData p = await CategoryData.frommap(data.data());
      _f.add(p);
      cate.RefreshCategory();
    } else if (namecate[0] == values[0] && namecate[1] == values[1] || namecate[0] == values[0] || namecate[0] == [1]) {
      CategoryData p = await CategoryData.frommap(data.data());
      _f.add(p);
    }
  });
  Future.delayed(Duration(seconds: 1), () {
    if (_f.length != 0) {
      print(_f.length);
      cate.category = _f;
      cate.RefreshCategory();
    } else {
      cate.category.clear();
      print(_cate.length);
      cate.category = _cate;
      cate.RefreshCategory();
      //dddd
    }
  }).catchError((err) {});
}
