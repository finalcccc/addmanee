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
  order_admin.Productditill.clear();
  order_admin.Dettil.clear();
  List<CartModel> _Detilmo =[];
  List<CategoryData> cate= [];
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
        QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
            .collection('categorys')
            .where('id', isEqualTo: f.category_id)
            .get();
        rfn.docs.forEach((element) async{
          CategoryData c = await CategoryData.frommap(element.data());
          cate.add(c);
          order_admin.Product_categoryname = cate;
          order_admin.Refresh();
        });
      });

    }
    );
    Future.delayed(Duration(seconds: 1),(){
      order_admin.Productditill = prodetill;
      order_admin.Dettil =_Detilmo;
      order_admin.Refresh();
    });

  });

}
