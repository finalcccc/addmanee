
import 'dart:math';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/model/product_data.dart';

XFile? image;

Future uploadProduct() async {
  FirebaseFirestore.instance.collection("products").add(<String, dynamic>{
    'xxx': 'xxx',
  }).then((value) => print('upload'));
}

Future addimgae() async {
  image = await ImagePicker().pickImage(source: ImageSource.gallery);
}

Future<void> uptostorge( String? nameProduct,
    String? desciption, int? prices, cost, amount, String? category) async {
  Product_data product = Product_data();
  try {
    UploadTask uploadTask;
    int random = Random().nextInt(10000000);
    Reference ref = await FirebaseStorage.instance.ref().child("image/${random}");
    CollectionReference reference = FirebaseFirestore.instance.collection('products');
     FirebaseFirestore rfn = FirebaseFirestore.instance;

    final metadata = SettableMetadata(
      contentType: 'image/png',
      customMetadata: {'picked-file-path': image!.path},
    );

    await ref.putFile(io.File(image!.path), metadata);
   String url = await ref.getDownloadURL();
  product.image = await url;
    product.nameProduct = nameProduct;
    product.category = category;
    product.price =prices;
    product.cost=cost;
    product.amount =amount;
    product.category = desciption;
    product.desciption = desciption;
    DocumentReference docid = await reference.add(product.toMap());
     product.id = docid.id;
    print(product.id);
    print(product.image);
    int i =0;
    docid.set(product.toMap());
    QuerySnapshot<Map<String,dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("products").get();
    querySnapshot.docs.map((e){
     Product_data s = Product_data.getProdct(e.data());
     product.product.add(s);
     print('${product.product[i].nameProduct} ${i}');
     i++;
    }).toList();

  } catch (e) {
    return print(e.toString());
  }
}
