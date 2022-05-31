import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/api/aip.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/model/product_data.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}
class _AddProductState extends State<AddProduct> {
  Product_data Product = Product_data();
  XFile? images;
  double neenear = 55;
void set(){
  setState(() {
    images = image;
  });
  
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: element.main,
        leading: element.backpage(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 32,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  addimgae();
                  Timer(
                    Duration(seconds: 2),
                      ()=>set()
                  );
                  neenear = 100;
                },
                child: CircleAvatar(
                  radius: neenear ,
                  backgroundColor: element.main,
                  child: images != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
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
                              Text('ຮູບພາບ',style: TextStyle(color: Colors.grey[800],)),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _inputFields(context)
          ],
        ),
      ),
    );
  }
}

_inputFields(context) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "ຊື່ສິນຄ້າ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.shopping_cart_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "ລາຍລະອຽດ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.description_sharp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "ລາຄາ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.price_change_sharp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "ລາຄາທືນ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.price_change),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "ຈຳນວນ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.add),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "ປະເພດສິນຄ້າ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.category),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: element.main,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16)),
          onPressed: () {
            uptostorge( 'dddd','desciption', 10, 10, 10, 'category');
          },
          child: const Text(
            "ບັນທືກ",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ),
  );
}
