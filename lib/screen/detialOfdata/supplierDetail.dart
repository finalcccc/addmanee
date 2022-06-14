// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewSupplier.dart';

import '../../celement/elements.dart';

class SupplierDetail extends StatefulWidget {
  const SupplierDetail({Key? key}) : super(key: key);

  @override
  State<SupplierDetail> createState() => _SupplierDetailState();
}

class _SupplierDetailState extends State<SupplierDetail> {
  @override
  Widget build(BuildContext context) {
    SupplierNotifire supplier = Provider.of<SupplierNotifire>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ຂໍ້ມູນລາຍລະອຽດຂອງແຕ່ລະຄົນ'),
          centerTitle: true,
          leading: element().RoutePageBack(context, const ViewSupplier()),
          backgroundColor: element.main,
        ),
        body: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            child: Container(
              height: 400,
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'ວັນທີ:' +
                              ' ${supplier.CurrentSupplier!.date.toString().substring(0, 10)}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'ລະຫັດ: ' + ' ${supplier.CurrentSupplier!.id}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'ຊື່: ' + ' ${supplier.CurrentSupplier!.name}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'ອີແມວ: ' + ' ${supplier.CurrentSupplier!.email}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'ເບີໂທ: ' + ' ${supplier.CurrentSupplier!.tel}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'ທີ່ຢູ່: ' + ' ${supplier.CurrentSupplier!.address}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'ແກ້ໄຂ',
                              style: TextStyle(fontSize: 16),
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'ບັນທຶກ',
                              style: TextStyle(fontSize: 16),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
