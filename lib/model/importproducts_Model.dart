// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class import_products {
  String? id_purchase;
  String? id_products;
  num? amout ;
  num? cost;
  num? amouttotal;
  Timestamp? date;
  import_products({this.amout,this.id_products,this.id_purchase,this.cost,this.amouttotal});

  Map<String, dynamic> toMap() {
    return {
      ' id_purchase': id_purchase,
      'id_products': id_products,
      'cost': cost,
      'amout': amout,
      'amouttotal': amouttotal,
       'date': Timestamp.now()
    };
  }
}
