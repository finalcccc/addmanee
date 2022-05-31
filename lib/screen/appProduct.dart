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
  double neenear = 55;
  String? position;

  void set() {
    setState(() {
      images = image;
    });
  }

  ceck() {
    if (Key.currentState!.validate()) {
      Key.currentState!.save();
    }
  }

  elevatedButton() {
    return Container(
      width: 390,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: element.main,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16)),
        onPressed: () {
          uptostorge('dddd', 'desciption', 10, 10, 10, 'category');
          ceck();
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
        leading: element.backpage(context),
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
              Timer(Duration(seconds: 2), () => set());
              neenear = 100;
            },
            child: CircleAvatar(
              radius: neenear,
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
              _inputFields(
                  context,
                  trye: 'Name',
                  Keybordtye: TextInputType.text,
                  hint: 'ຊື່ສິນຄ້າ',
                  icons: Icons.production_quantity_limits,
              ),
              SizedBox(height: 10),
              _inputFields(
                context,
                trye: 'Name',
                Keybordtye: TextInputType.text,
                hint: 'ຊື່ສິນຄ້າ',
                icons: Icons.production_quantity_limits,
              ),
              SizedBox(height: 10),
              _inputFields(
                context,
                trye: 'Name',
                Keybordtye: TextInputType.text,
                hint: 'ຊື່ສິນຄ້າ',
                icons: Icons.production_quantity_limits,
              ),
              SizedBox(height: 10),
              _inputFields(
                context,
                trye: 'Name',
                Keybordtye: TextInputType.text,
                hint: 'ຊື່ສິນຄ້າ',
                icons: Icons.production_quantity_limits,
              ),
              SizedBox(height: 10),
              comboboxcontainer(context),
              SizedBox(height: 10),
              elevatedButton(),
            ],
          ),
        ),
      ],
    );
  }
}

_inputFields(context, {String? trye, TextInputType? Keybordtye, String? hint,IconData? icons }) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hint,
      fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
      filled: true,
      prefixIcon: Icon(icons),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    ),
    keyboardType: Keybordtye,
    validator: (v) {
      var tye = trye;
       if(v!.isEmpty){return 'ກະລຸໃສ່້ຂໍມູນ';}else if(v.length<3){return 'ຊື່ສິນຄ້າສັ້ນໄປ';}
      switch (tye) {
        case "Name":
          {

          }
          break;
        case "B":
          {

          }
          break;

        case "C":
          {

          }
          break;

        case "D":
          {

          }
          break;

        default:
          {
          }
          break;
      }
    },
    onTap: () {},
  );
}

Container comboboxcontainer(context) {
  return Container(
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
