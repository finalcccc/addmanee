

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/CartdetailData.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';
import 'package:untitled1/notifire/productNotifire.dart';

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