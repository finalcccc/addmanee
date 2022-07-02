

// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, no_leading_underscores_for_local_identifiers

 import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/category_Model.dart';
import 'package:untitled1/model/purchase_order_Model.dart';
import 'package:untitled1/model/product_Model.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';

import '../../notifire/purchase_order_Notifire.dart';

//  phuas
Upload_Data_phuashOrder(Cartnotifire Cart)async{

  CartModelupload Cartm = CartModelupload();
 Cart.Cartlist.forEach((element)async {
  CartModel m = await CartModel(element.Product!.id,element.amout);
  Cartm.Ditell.add(m.toMap());

 });
 Cartm.amouttotal = Cart.amoultoal;
 Cartm.Supplier_ID = Cart.Cartsupp;
  CollectionReference reference = await FirebaseFirestore.instance.collection('purchase_order');
  DocumentReference docid = await reference.add(Cartm.toMap());
  Cartm.id =docid.id;
  docid.set(Cartm.toMap());
}

GetPureChaseNoly({required purchase_order_Notifire? order_admin,required SupplierNotifire? supp})async{

   List<CartModelupload> _Sup = [];
 QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
     .collection('purchase_order')
     .where('Supplier_ID', isEqualTo: supp!.CurrentSupplier!.id)
     .get();
 rfn.docs.forEach((element) async{
 CartModelupload Sud = await CartModelupload.formMap(element.data());
  _Sup.add(Sud);
 }
 );
 order_admin!.Order_addmin =_Sup;

 order_admin.Refreshorderaddmin();
}

Future GetDetill({required purchase_order_Notifire order_admin})async{
 List<CartModel> _Detilmo =[];
 List<product_Model> prodetill =[];
 QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
     .collection('purchase_order')
     .where('date', isEqualTo: order_admin.Currenorderaddmin!.date)
     .get();
 rfn.docs.forEach((element) async{
  List f = await element['Ditell'];
  f.forEach((element) async{
   CartModel m = await CartModel.formMAp(element);
   _Detilmo.add(m);

   QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
       .collection('products')
       .where('id', isEqualTo: m.Product_ID)
       .get();
   rfn.docs.forEach((element)async{
      product_Model f = await  product_Model.formMap(element.data());
      prodetill.add(f);
   });

   prodetill.forEach((element)async {
    QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
        .collection('categorys')
        .where('id', isEqualTo: element.category_id)
        .get();
    rfn.docs.forEach((element) async{
      CategoryData c = await CategoryData.frommap(element.data());
     order_admin.Product_categoryname.add(c);
   });
  });
 }
 );
    fetchUserOrder(order_admin, prodetill, _Detilmo);
 });

}
Future<void> fetchUserOrder( purchase_order_Notifire order_admin,prodetill,_Detilmo) async {
 Future.delayed(const Duration(seconds: 2),
         () {
          order_admin.Refresh();
          order_admin.Productditill = prodetill;
          order_admin.Dettil =_Detilmo;
         });
}