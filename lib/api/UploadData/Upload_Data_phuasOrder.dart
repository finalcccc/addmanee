

 import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/CartdetailData.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';

import '../../notifire/purchase_order_Notifire.dart';


Upload_Data_phuashOrder(Cartnotifire Cart)async{

  CartModelupload Cartm = CartModelupload();
  List<CartModel>Ditell =[];

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

GetDetill({required purchase_order_Notifire? order_admin})async{
 List<CartModel> _Detilmo =[];
 QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
     .collection('purchase_order')
     .where('date', isEqualTo: order_admin!.Currenorderaddmin!.date)
     .get();
 rfn.docs.forEach((element) async{
  List f = await element['Ditell'];
  f.forEach((element) async{
   CartModel m = await CartModel.formMAp(element);
   _Detilmo.add(m);
  });
 }
 );
 order_admin.Dettil =_Detilmo;
}