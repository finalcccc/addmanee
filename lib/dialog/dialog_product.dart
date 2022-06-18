// ignore_for_file: camel_case_types, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/productNotifire.dart';
import 'package:untitled1/screen/detialOfdata/productDetail.dart';

import '../api/aip.dart';


class ProductDialogState {
  Future<XFile> AddImages() async {
    XFile? _image  = await ImagePicker().pickImage(source: ImageSource.gallery);
    return _image!;
  }
  final GlobalKey<FormState> _key_import = GlobalKey<FormState>();
  double area = 55;
  Dialog(context, ProductNotifire product,)async {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.indeterminate_check_box_outlined,
                        color: Colors.red, size: 30),
                    onPressed: () {
                      product.ChangeImage = null;
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    children: [
                      Form(
                        key: _key_import,
                        child: SizedBox(
                          width: 400,
                          height: 500,
                          child: Card(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: GestureDetector(
                                        onDoubleTap: (){
                                        },
                                        onTap: ()async{
                                         AddImages().then((value) { product.image(value);
                                         Navigator.pop(context);
                                         ProductDialogState().Dialog(context, product);
                                         });

                                        },
                                        child: CircleAvatar(
                                            radius: 80,
                                            backgroundColor: element.wht,
                                            child: product.ChangeImage != null
                                                ? ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              child: Image.file(
                                                File(product.ChangeImage!.path),
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                                : Container(
                                              height: 200,
                                              width: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                    Axis.vertical,
                                                    child: Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              10),
                                                          child:
                                                          Image.network(
                                                            "${product.CurrentProduct!.image}",
                                                            width: 150,
                                                            height: 140,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                    TextFormField(
                                      initialValue: '',
                                      decoration: const InputDecoration(
                                        hintText: "ຊື່ສິນຄ້າ",
                                        prefixIcon: Icon(
                                            Icons.production_quantity_limits_sharp),
                                      ),
                                      onChanged: (value) {
                                        product.RefreshProduct();
                                      },
                                      onSaved: (value) {},
                                      validator: (cost) {
                                        if (cost!.isEmpty) {
                                          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                        } else if (cost.length < 4) {
                                          return "ກວດສວບລາຄາ";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    TextFormField(
                                      initialValue: '',
                                      decoration: const InputDecoration(
                                        hintText: "ລາຄາ",
                                        prefixIcon:
                                        Icon(Icons.price_check_outlined),
                                      ),
                                      onSaved: (value) {},
                                      validator: (amout) {
                                        if (amout!.isEmpty) {
                                          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                        } else if (amout.isEmpty) {
                                          return "ກວດສວບລາຄາ";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    TextFormField(
                                      initialValue: '',
                                      decoration: const InputDecoration(
                                        hintText: "ຈຳນວນ",
                                        prefixIcon: Icon(Icons.qr_code),
                                      ),
                                      onSaved: (_address) {},
                                      validator: (cost) {
                                        if (cost!.isEmpty) {
                                          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                        } else if (cost.length < 4) {
                                          return "ກວດສວບລາຄາ";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    TextFormField(
                                      initialValue: '',
                                      decoration: const InputDecoration(
                                        hintText: "ເລືອກປະເພດສິນຄ້າ",
                                      ),
                                      onSaved: (_address) {},
                                      validator: (cost) {
                                        if (cost!.isEmpty) {
                                          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                        } else if (cost.length < 4) {
                                          return "ກວດສວບລາຄາ";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    TextFormField(
                                      initialValue: '',
                                      decoration: const InputDecoration(
                                        hintText: "ລາຍລະອຽດ",
                                        prefixIcon: Icon(Icons.details_sharp),
                                      ),
                                      onSaved: (_address) {},
                                      validator: (cost) {
                                        if (cost!.isEmpty) {
                                          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                        } else if (cost.length < 4) {
                                          return "ກວດສວບລາຄາ";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 30),
                                    SizedBox(
                                      width: 300,
                                      height: 55,
                                      child: ElevatedButton(
                                        child: const Text(
                                          'ບັນທືກ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        onPressed: () async {
                                          product.RefreshProduct();
                                          if (_key_import.currentState!
                                              .validate()) {
                                            _key_import.currentState!.save();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

