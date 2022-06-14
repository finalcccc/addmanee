// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class CategoryDialog {
  final GlobalKey<FormState> _key_import = GlobalKey<FormState>();
  Dialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(child: SingleChildScrollView(
            child: AlertDialog(
              actions: [
                IconButton(
                  icon: const Icon(Icons.indeterminate_check_box_outlined,
                      color: Colors.red, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  children: [
                    Form(
                      key: _key_import,
                      child: SizedBox(
                        width: 400,
                        height: 200,
                        child: Card(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    initialValue: '',
                                    decoration: const InputDecoration(
                                      hintText: "ປະເພດສິນຄ້າ",
                                      prefixIcon: Icon(Icons.person),
                                    ),
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
                                  const SizedBox(height: 50),
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
                                        if (_key_import.currentState!.validate()) {
                                          _key_import.currentState!.save();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),);
        });
  }
}