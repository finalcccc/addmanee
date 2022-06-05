// ignore_for_file: avoid_print

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/screen/product_add/appProduct.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewEmployee.dart';

import '../../model/employee_data.dart';

class EmployeeTapbar extends StatefulWidget {
  const EmployeeTapbar({Key? key}) : super(key: key);

  @override
  State<EmployeeTapbar> createState() => _EmployeeTapbarState();
}

class _EmployeeTapbarState extends State<EmployeeTapbar> {
  @override
  Widget build(BuildContext context) {
    return element().TabbarPage(
        label1: ' ຂໍ້ມູນພະນັກງານ',
        icos1: Icons.feed,
        icos2: Icons.feed,
        label2: 'ລາຍລະອຽດຂອງພະນັກງານ',
        tap1: const Register(),
        tap2: const ViewEmployee());
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

final formKey = GlobalKey<FormState>();

String? name, email, password, confirmPassword, tel,address, position;
bool set = false;

final Future<FirebaseApp> firebase = Firebase.initializeApp();

class _RegisterState extends State<Register> {
  element elemnts = element();

  check() async {
    //up to database
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (position != null) {
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email!, password: password!)
              .then((value) async {
            formKey.currentState!.reset();
            Fluttertoast.showToast(
              msg: "ລົງທະບຽນໄດ້ແລ້ວ",
              fontSize: 20,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            );
            String uid = value.user!.uid;
            print("uid = $uid");

            EmployeeData employeeData = EmployeeData(
              id:uid,
              name: name!,
              email: email!,
              password: password!,
              tel: tel!,
              address: address!,
              position: position!,
            );
            final Map<String, dynamic>? data = employeeData.toMap();
            await FirebaseFirestore.instance
                .collection("employees")
                .doc(uid)
                .set(data!)
                .then(
              (value) {
                print('Insert value in to fireStore success');
                setState(() {
                  position = null;
                });
              },
            );
          });
        } on FirebaseAuthException catch (e) {
          // print(e.message);
          // print(e.code);
          Fluttertoast.showToast(
            msg: e.message!,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
          );
        }
      } else {
        return elemnts.showdialog(context,
            title: 'ຍັງບໍ່ທັນໄດ້ເລືອກຕຳເເໜ່ງ', content: 'ກະລຸນາເລືອກຕຳເເໜ່ງ');
      }
    }
  }

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
      },
    );
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "ລົງທະບຽນຂໍ້ມູນພະນັກງານ",
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
              onChanged: (value) => name = value.trim(),
              validator: (String? name) {
                if (name!.isEmpty) {
                  return "ກະລຸນາປ້ອນຊື່ ແລະ ນາມສະກຸນ";
                } else if (name.length < 3) {
                  return "ຊື່ ແລະ ນາມສະກຸນມັນສັ້ນເກີນໄປ";
                }
                name = name.toString();
                return null;
              }),
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
            onChanged: (value) => email = value.trim(),
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
              hintText: "ລະຫັດຜ່ານ",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
            obscureText: true,
            onChanged: (value) => password = value.trim(),
            validator: (String? password) {
              if (password!.isEmpty) {
                return "ກະລຸນາປ້ອນລະຫັດຜ່ານ";
              } else if (password.length < 6) {
                return "ລະຫັດຜ່ານມັນສັ້ນເກີນໄປ";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "ຍືນຍັນລະຫັດຜ່ານ",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (value) => confirmPassword = value.trim(),
            validator: (String? confirmPassword) {
              if (confirmPassword == password) {
                return null;
              } else if (confirmPassword != password) {
                return "ລະຫັດ ແລະ ຄອນເຟີມລະຫັດມັນບໍ່ເທົ່າກັນ";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          comboboxcontainer(context),
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
              onChanged: (value) => tel = value.trim(),
              validator: (String? tel) {
                if (tel!.isEmpty) {
                  return "ກະລຸນາປ້ອນເບີໂທລະສັບ";
                } else if (tel.length < 10) {
                  return "ເບີໂທລະສັບບໍ່ຖືກຕ້ອງ";
                }
                return null;
                //return ;
              }),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "ວັນ ເດືອນ ປີ ເກີດ",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
            validator:
                RequiredValidator(errorText: "ກະລຸນາປ້ອນ ວັນ ເດືອນ ປີ ເກີດ"),
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
            onChanged: (value) => address = value.trim(),
            validator: RequiredValidator(errorText: "ກະລຸນາປ້ອນທີ່ຢູ່"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: element.main,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () async {
              setState(() {
                check();
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Viewproduct(),));
              });
            },
            child: const Text(
              "ບັນທືກ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container comboboxcontainer(context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [dropdownButton()],
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
          setState(() {
            position = v!;
          });
        });
  }
}
