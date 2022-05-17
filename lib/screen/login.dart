// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/screen/register.dart';

import 'menu.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ລ໋ອກອິນ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "ຮ້ານເເອັດມານີ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            TextFormField(
              decoration: InputDecoration(
                hintText: "ອີເມວ",
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
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
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: "ລະຫັດຜ່ານ",
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
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
            const SizedBox(height: 40),
            SizedBox(
              height: 65,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: element.sky,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ),
                  );
                },
                child: const Text(
                  "ລ໋ອກອິນ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
