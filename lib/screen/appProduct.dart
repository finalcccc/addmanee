// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/api/aip.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/model/product_data.dart';
import 'package:untitled1/screen/registerEmployee.dart';

import '../model/employee_data.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> Key = GlobalKey<FormState>();
  Product_data Product = Product_data();
  XFile? images;
  double area = 55;

  void set() {
    setState(() {
      images = image;
    });
  }

  check() {
    if (Key.currentState!.validate()) {
      Key.currentState!.save();
    }
  }

  elevatedButton() {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      width: 390,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: element.main,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16)),
        onPressed: () {
          uptostorge('dddd', 'description', 10, 10, 10, 'category');
          check();
        },
        child: const Text(
          "ບັນທືກ",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: element.main,
        leading: element.BackPage(context),
      ),
      body: SingleChildScrollView(
        child: buildColumn(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 32,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              addimgae();
              Timer(
                const Duration(seconds: 2),
                () => set(),
              );
              area = 100;
            },
            child: CircleAvatar(
              radius: area,
              backgroundColor: element.main,
              child: images != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(images!.path),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 102,
                      height: 102,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                          Text('ຮູບພາບ',
                              style: TextStyle(
                                color: Colors.grey[800],
                              )),
                        ],
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Form(
          key: Key,
          child: Column(
            children: [
              element.inputFields(
                context,
                trye: 'nameProduct',
                hint: 'ຊື່ສິນຄ້າ',
                icons: Icons.production_quantity_limits,
                Keybordtye: TextInputType.text,
              ),
              const SizedBox(height: 10),
              element.inputFields(
                context,
                hint: 'ລາຄາຕົ້ນທືນ',
                icons: Icons.price_check,
                Keybordtye: TextInputType.number,
                trye: 'cost',
              ),
              const SizedBox(height: 10),
              element.inputFields(
                context,
                hint: 'ລາຄາ',
                icons: Icons.price_check,
                Keybordtye: TextInputType.number,
                trye: 'price',
              ),
              const SizedBox(height: 10),
              element.inputFields(
                context,
                hint: 'ລາລະອຽດ',
                icons: Icons.production_quantity_limits,
                Keybordtye: TextInputType.text,
                trye: 'description',
              ),
              const SizedBox(height: 10),
              element.inputFields(
                context,
                hint: 'ຈຳນວນ',
                icons: Icons.qr_code,
                Keybordtye: TextInputType.number,
                trye: 'amount',
              ),
              const SizedBox(height: 10),
              comboboxcontainer(context),
              const SizedBox(height: 20),
              elevatedButton(),
            ],
          ),
        ),
      ],
    );
  }
}

Container comboboxcontainer(context) {
  return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          dropdownButton(),
        ],
      ));
}

DropdownButton<String> dropdownButton() {
  return DropdownButton(
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 50,
      ),
      borderRadius: BorderRadius.circular(50),
      value: position,
      isExpanded: true,
      underline: Container(),
      hint: const Padding(
        padding: EdgeInsets.only(left: 50),
        child: Text("ເລືອກຕຳເເໜ່່ງ"),
      ),
      // icon: const Icon(Icons.keyboard_arrow_down),
      items: EmployeeData.positoin
          .map((e) => DropdownMenuItem(
              value: e,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(e),
              )))
          .toList(),
      onChanged: (String? v) {
        position = v;
      });
}
