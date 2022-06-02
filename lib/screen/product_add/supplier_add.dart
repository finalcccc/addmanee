import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/model/supplier_data.dart';
import 'package:untitled1/screen/product_add/appProduct.dart';
import 'package:untitled1/screen/product_add/category.dart';


class supplier_tapbar extends StatefulWidget {
  const supplier_tapbar({Key? key}) : super(key: key);

  @override
  State<supplier_tapbar> createState() => _supplier_tapbarState();
}

class _supplier_tapbarState extends State<supplier_tapbar> {

  @override
  Widget build(BuildContext context) {
    return element().tabbarpage(label1: 'v',icos1: Icons.feed,icos2: Icons.feed ,label2: 'g',tap1: Supplier(),tap2: AddProduct());
  }
}
class Supplier extends StatefulWidget {
  const Supplier({Key? key}) : super(key: key);

  @override
  State<Supplier> createState() => _SupplierState();
}

final formKey = GlobalKey<FormState>();
final Future<FirebaseApp> firebase = Firebase.initializeApp();
SupplierData supplierData = SupplierData();
CollectionReference supplierCollection =
    FirebaseFirestore.instance.collection("suppliers");

class _SupplierState extends State<Supplier> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: element.main,
                leading: element.BackPage(context),
              ),
              body: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _header(context),
                        const SizedBox(height: 40),
                        _inputFields(context),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "ຂໍ້ມູນຜູ້ສະໜອງ",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "ຮ້ານເເອັດມານີ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _inputFields(context) {
    return Form(
      key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "ຊື່ ແລະ ນາມສະກຸນ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          onSaved: (String? name) {
            supplierData.name = name;
          },
          validator: (String? name) {
            if (name!.isEmpty) {
              return "ກະລຸນາປ້ອນຊື່ ແລະ ນາມສະກຸນ";
            } else if (name.length < 6) {
              return "ຊື່ ແລະ ນາມສະກຸນມັນສັ້ນເກີນໄປ";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "ອີເມວ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? email) {
            supplierData.email = email;
          },
          validator: MultiValidator(
            [
              RequiredValidator(errorText: "ກະລຸນາປ້ອນອີເມວ"),
              EmailValidator(errorText: "ຮູບແບບອີເມວບໍ່ຖືກຕ້ອງ"),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "ເບີໂທລະສັບ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.phone_bluetooth_speaker_sharp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.number,
          onSaved: (String? tel) {
            supplierData.tel = tel;
          },
          validator: (String? tel) {
            if (tel!.isEmpty) {
              return "ກະລຸນາປ້ອນເບີໂທລະສັບ";
            } else if (tel.length < 10) {
              return "ເບີໂທລະສັບບໍ່ຖືກຕ້ອງ";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "ທີ່ຢູ່",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.home_filled),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          onSaved: (String? address) {
            supplierData.address = address;
          },
          validator: RequiredValidator(errorText: "ກະລຸນາປ້ອນທີ່ຢູ່"),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "ສິນຄ້າຜູ້ສະໜອງ",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.production_quantity_limits),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          onSaved: (String? supplyProduct) {
            supplierData.supplyProduct = supplyProduct;
          },
          validator:
              RequiredValidator(errorText: "ກະລຸນາປ້ອນສິນຄ້າຂອງຜູ້ສະໜອງ"),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: element.main,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              await supplierCollection.add({
                "name": supplierData.name,
                "email": supplierData.email,
                "tel": supplierData.tel,
                "address": supplierData.address,
                "supplierProduct": supplierData.supplyProduct,
              });
              formKey.currentState!.reset();
              Fluttertoast.showToast(
                msg: "ໄດ້ເພີ່ມຂໍ້ມູນຜູ້ສະໜອງແລ້ວ",
                fontSize: 20,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.white,
                textColor: Colors.black,
              );
            }
          },
          child: const Text(
            "ບັນທືກ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
