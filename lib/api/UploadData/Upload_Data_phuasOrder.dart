

 import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/purchase_order_Model.dart';
import 'package:untitled1/model/product_Model.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';

import '../../notifire/purchase_order_Notifire.dart';

//  phuas
Upload_Data_phuashOrder(Cartnotifire Cart)async{

  CartModelupload Cartm = CartModelupload();
 Cart.Cartlist.forEach((element)async {
  CartModel m = CartModel(element.Product!.nameProduct,element.amout);
  Cartm.Ditell.add(m.toMap());

 });
 Cartm.amouttotal = Cart.amoultoal;
 Cartm.NameSupplier = Cart.Cartsupp;
  CollectionReference reference = await FirebaseFirestore.instance.collection('purchase_order');
  DocumentReference docid = await reference.add(Cartm.toMap());
  Cartm.id =docid.id;
  docid.set(Cartm.toMap());
}

GetPureChaseNoly({required purchase_order_Notifire? order_admin,required SupplierNotifire? supp})async{

   List<CartModelupload> _Sup = [];
 QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
     .collection('purchase_order')
     .where('NameSupplier', isEqualTo: supp!.CurrentSupplier!.name)
     .get();
 rfn.docs.forEach((element) async{
 CartModelupload Sud = CartModelupload.formMap(element.data());
  _Sup.add(Sud);
 }
 );
 order_admin!.Order_addmin =_Sup;

 order_admin.Refreshorderaddmin();
}

Future GetDetill({required purchase_order_Notifire? order_admin})async{
 List<CartModel> _Detilmo =[];
 List<product_Model> prodetill =[];
 QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
     .collection('purchase_order')
     .where('date', isEqualTo: order_admin!.Currenorderaddmin!.date)
     .get();
 rfn.docs.forEach((element) async{

  List f = await element['Ditell'];

  f.forEach((element) async{

   CartModel m = await CartModel.formMAp(element);
   _Detilmo.add(m);

   QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
       .collection('products')
       .where('nameProduct', isEqualTo: m.NameProduct)
       .get();
   rfn.docs.forEach((element)async{
      product_Model f = await  product_Model.formMap(element.data());
      prodetill.add(f);
   });
  });
 }
 );
 Timer(
     const Duration(seconds: 1),
         (){ order_admin.Refresh();});
 order_admin.Productditill = prodetill;
 order_admin.Dettil =_Detilmo;

}