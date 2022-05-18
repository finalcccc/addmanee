import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/model/profile.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

final formKey = GlobalKey<FormState>();
Profile profile = Profile();
final Future<FirebaseApp> firebase = Firebase.initializeApp();
CollectionReference employeeCollection =
    FirebaseFirestore.instance.collection("employee");

class _RegisterState extends State<Register> {
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
              leading: element.backpage(context),
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
              onSaved: (String? name) {
                profile.name = name;
              },
              validator: (String? name) {
                if (name!.isEmpty) {
                  return "ກະລຸນາປ້ອນຊື່ ແລະ ນາມສະກຸນ";
                } else if (name.length < 6) {
                  return "ຊື່ ແລະ ນາມສະກຸນມັນສັ້ນເກີນໄປ";
                }
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
            onSaved: (String? email) {
              profile.email = email;
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
            onSaved: (String? password) {
              profile.password = password;
            },
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
            onSaved: (String? confirmPassword) {
              profile.confirmPassword = confirmPassword;
            },
            validator: (String? confirmPassword) {
              if (profile.confirmPassword == profile.password) {
                return null;
              } else if (profile.confirmPassword != profile.password) {
                return "ລະຫັດ ແລະ ຄອນເຟີມລະຫັດມັນບໍ່ເທົ່າກັນ";
              }
              return null;
            },
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
                profile.tel = tel;
              },
              validator: (String? tel) {
                if (tel!.isEmpty) {
                  return "ກະລຸນາປ້ອນເບີໂທລະສັບ";
                } else if (tel.length < 10) {
                  return "ເບີໂທລະສັບບໍ່ຖືກຕ້ອງ";
                }
                return null;
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
            onSaved: (String? date) {
              profile.date = date;
            },
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
            onSaved: (String? address) {
              profile.address = address;
            },
            validator: RequiredValidator(errorText: "ກະລຸນາປ້ອນທີ່ຢູ່"),
          ),
          const SizedBox(height: 10),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: "ສະຖານະ",
          //     fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          //     filled: true,
          //     prefixIcon: const Icon(Icons.signal_wifi_statusbar_4_bar_sharp),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(18),
          //       borderSide: BorderSide.none,
          //     ),
          //   ),
          //   obscureText: true,
          // ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "ຕຳແໜ່ງ",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.work_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
            onSaved: (String? position) {
              profile.position = position;
            },
            validator: RequiredValidator(errorText: "ກະລຸນາປ້ອນຕຳແໜ່ງ"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: element.main,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () async {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const login()),
              //  );

              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                await employeeCollection.add({
                  "name": profile.name,
                  "email": profile.email,
                  "password": profile.password,
                  "confirmPassword": profile.confirmPassword,
                  "tel": profile.tel,
                  "date": profile.date,
                  "address": profile.address,
                  "position": profile.position,
                });
                formKey.currentState?.reset();
                // email and passwor authencation
                // try {
                //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
                //     email: profile.email!,
                //     password: profile.password!,
                //   );
                //   Fluttertoast.showToast(
                //     msg: "ລົງທະບຽນຮຽບຮ້ອຍແລ້ວ",
                //     gravity: ToastGravity.CENTER,
                //   );
                //   formKey.currentState!.reset();
                // } on FirebaseAuthException catch (e) {
                //   // print(e.message);
                //   // print(e.code);
                //   Fluttertoast.showToast(
                //     msg: e.message!,
                //     gravity: ToastGravity.CENTER,
                //   );
                // }
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
        ],
      ),
    );
  }
}
