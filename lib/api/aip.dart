

import 'dart:math';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/model/product_data.dart';


import '../model/category.dart';


XFile? image;
Future addimgae() async {
  image = await ImagePicker().pickImage(source: ImageSource.gallery);
}

Future<void> uploadproducts( {String? nameProduct,
    String? desciption, int? prices, cost, amount, String? category}) async {
  Product_data product = Product_data();
  try {
    int random = Random().nextInt(1000);
    Reference ref = await FirebaseStorage.instance.ref().child("image/${nameProduct}${random}");
    CollectionReference reference = FirebaseFirestore.instance.collection('products');

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
    product.desciption = category;
    DocumentReference docid = await reference.add(product.toMap());
     product.id = docid.id;
    print(product.id);
    print(product.image);
    docid.set(product.toMap());
;

  } catch (e) {
    return print(e.toString());
  }
}

String? categorys;
 cate(v){
categorys = v;
}

addproducttype()async{
  catagory_data category = catagory_data();
  try {
    CollectionReference reference = FirebaseFirestore.instance.collection('categorys');
    category.category = categorys;
    DocumentReference docid = await reference.add(category.toMap());
    category.id = docid.id;
    docid.set(category.toMap());
    print(category.category);
  } catch (e) {
    print(e);
  }

}
