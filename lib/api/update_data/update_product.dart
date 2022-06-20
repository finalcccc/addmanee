import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/api/getProduct.dart';
import 'package:untitled1/model/product_Model.dart';

import '../../notifire/productNotifire.dart';

Update_products(ProductNotifire  pro) async{



  if(pro.ChangeImage == null) {
    FirebaseFirestore.instance
        .collection('products')
        .doc(pro.CurrentProduct!.id)
        .update(pro.CurrentProduct!.toMap()).then((value) {
      pro.RefreshProduct();
    });
  }else if (pro.ChangeImage != null){
    FirebaseStorage.instance.ref().child(pro.CurrentProduct!.image.toString()).delete().then((value) async {
      int random = Random().nextInt(1000);
      final metadata = SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': pro.ChangeImage!.path},
      );
      Reference ref = await FirebaseStorage.instance
          .ref()
          .child("image/${pro.CurrentProduct!.nameProduct}${random}");
      await ref.putFile(File(pro.ChangeImage!.path), metadata);
     await ref.getDownloadURL().then((value) {
        pro.CurrentProduct!.image =value;
        FirebaseFirestore.instance
            .collection('products')
            .doc(pro.CurrentProduct!.id)
            .update(pro.CurrentProduct!.toMap()).then((value) {
          pro.RefreshProduct();
          GetProduct(pro);
        });
      });



    });

  }
}