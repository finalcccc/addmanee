// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({Key? key}) : super(key: key);

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  element elements = element();
  GlobalKey<FormState> Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ສັ່ງຊື້ສິນຄ້າເຂົ້າຮ້ານ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: Key,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      elements.inputFields(
                        context: context,
                        hint: 'ລະຫັດການສັງຊື້',
                        icons: Icons.password_outlined,
                        Keybordtye: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      elements.inputFields(
                        context: context,
                        hint: 'ລະຫັດຜູ້ສະໜອງ',
                        icons: Icons.password_outlined,
                        Keybordtye: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      elements.inputFields(
                        context: context,
                        hint: 'ລະຫັດສິນຄ້າ',
                        icons: Icons.password_outlined,
                        Keybordtye: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      elements.inputFields(
                        context: context,
                        hint: 'ຈຳນວນ',
                        icons: Icons.production_quantity_limits_sharp,
                        Keybordtye: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      elements.inputFields(
                        context: context,
                        hint: 'ລາຄາ',
                        icons: Icons.price_check,
                        Keybordtye: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      elements.inputFields(
                        context: context,
                        hint: 'ຈຳນວນທັງໝົດ',
                        icons: Icons.production_quantity_limits_sharp,
                        Keybordtye: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      elements.inputFields(
                        context: context,
                        hint: 'ລາຄາທັງໝົດ',
                        icons: Icons.price_change_outlined,
                        Keybordtye: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      elements.inputFields(
                        context: context,
                        hint: 'ສະຖານະ',
                        icons: Icons.save_alt_sharp,
                        Keybordtye: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      elements.elevatedButton(Key, 'addproduct'),
                      const SizedBox(height: 20),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
