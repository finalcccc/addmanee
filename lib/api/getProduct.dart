

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/product_data.dart';
import 'package:untitled1/notifire/productNotifire.dart';

getProductType(ProductNotifire product) async {
  List<ProductData> _Product = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .orderBy('amount')
      .get();
  rfn.docs.forEach((e) {
    print(e.data());
    ProductData f = ProductData.getProduct(e.data());
    _Product.add(f);
  },
  );
  product.Product = _Product;
  product.RefreshProduct();
}