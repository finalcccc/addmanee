


  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/Orde_Modelr.dart';
import 'package:untitled1/notifire/OrderNotifire.dart';

Get_Order(Order_Notifire Order)async{
    List<Order_Model_upload>order_model=[];
     QuerySnapshot<Map<String , dynamic>> rfn =await FirebaseFirestore.instance.collection('order').get();
     rfn.docs.forEach((element) {
       order_model.add(Order_Model_upload.formMap(element.data()));

     });
     Order.Order =order_model;
     Order.Referenc();
  }
