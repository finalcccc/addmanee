import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/model/product_data.dart';

Future uploadProduct() async {
  FirebaseFirestore.instance.collection("products").add(<String, dynamic>{
    'xxx': 'xxx',
  }).then((value) => print('upload'));
}

Future addimgae(String? name) async {
  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
  uptostorge(image!,name!);
}

Future<void> uptostorge(XFile? file,String name) async {
  try {
    UploadTask uploadTask;
     int random = Random().nextInt(10000000);
    Reference ref = await FirebaseStorage.instance.ref().child("image/${name}${random}");

    final metadata = SettableMetadata(
      contentType: 'image/png',
      customMetadata: {'picked-file-path': file!.path},
    );

    await ref.putFile(io.File(file.path), metadata);
   String url = await ref.getDownloadURL();
   Product_data product = Product_data(url);
   print(product.image);
  } catch (e) {
    return print(e.toString());
  }
}
