// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class EmployeeDialog {
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
                        height: 480,
                        child: Card(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    initialValue: '',
                                    decoration: const InputDecoration(
                                      hintText: "ຊື່ ແລະ ນາມສະກຸນ",
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
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    initialValue: '',
                                    decoration: const InputDecoration(
                                      hintText: "ອີເມວ",
                                      prefixIcon: Icon(Icons.email),
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
                                  ////////////////////////////////////////////////

                                  TextFormField(
                                    initialValue: '',
                                    decoration: const InputDecoration(
                                      hintText: "ລະຫັດ",
                                      prefixIcon: Icon(Icons.lock),
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
                                      hintText: "ເບີໂທ",
                                      prefixIcon: Icon(Icons.phone),
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
                                      hintText: "ວັນ ເດືອນ ປີເກີດ",
                                      prefixIcon: Icon(Icons.people),
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
                                      hintText: "ຕຳແໜ່ງ",
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
                                      hintText: "ທີ່ຢູ່",
                                      prefixIcon: Icon(Icons.home),
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