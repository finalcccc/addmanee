// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/api/aip.dart';
import 'package:untitled1/model/category_Model.dart';
import 'package:untitled1/model/product_Model.dart';
import 'package:untitled1/notifire/productNotifire.dart';
GetProduct(ProductNotifire product) async {
  List<product_Model> _Product = [];
  List<CategoryData> cate = [];
  product.cate = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .orderBy('amount')
      .get();
  rfn.docs.forEach(
    (e)async {
      print(e.id);
      product.RefreshProduct();
      product_Model f = product_Model.formMap(e.data());
      QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
          .collection('categorys')
          .where('id', isEqualTo: f.category_id)
          .get();
      rfn.docs.forEach(
            (e)async {
               CategoryData c = await CategoryData.frommap(e.data());
               _Product.add(f);
              cate.add(c);
               product.Product = _Product;
               product.cate = cate;
               product.RefreshProduct();
        },
      );
    },
  );


}

GetProduct_type(ProductNotifire product, var catename, index) async {
  List<product_Model> _Product = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .where('category_id', isEqualTo: catename)
      .get();
  rfn.docs.forEach(
    (e) {
      print(e.data());
      product_Model f = product_Model.formMap(e.data());
      _Product.add(f);
    },
  );
  product.Product = _Product;
  product.RefreshProduct();
}
