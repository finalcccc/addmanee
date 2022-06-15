// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/OrderNotifire.dart';
import 'package:intl/intl.dart';

class view_order extends StatefulWidget {
  const view_order({Key? key}) : super(key: key);

  @override
  State<view_order> createState() => _View_orderState();
}

class _View_orderState extends State<view_order> {
  @override
  Widget build(BuildContext context) {
    Order_Notifire order = Provider.of<Order_Notifire>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: element.main,
        leading: element.BackPage(context),
        title: const Text('ລາຍລະອຽດອໍເດີ້'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ລະຫັດສັ່ງຊື້ : ${order.Curren_Order!.id}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('ຊື່ລູກຄ້າ : ${order.Curren_Order!.nameCutommer}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('ເບີໂທ: ${order.Curren_Order!.tel}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('ທີ່ຢຸ່ : ${order.Curren_Order!.address}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('ຊື່ພະນັກງານ: ${order.emp_Ooder!.name}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('ວັນທີ: ${order.Curren_Order!.date!.toDate()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                      width: 60,
                      child: Text(
                        'ລຳດັບ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                  SizedBox(
                      width: 80,
                      child: Text('ຊື່ສິນຄ້າ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17))),
                  SizedBox(
                      width: 80,
                      child: Text('ປະເພດ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17))),
                  SizedBox(
                      width: 80,
                      child: Text('ລາຄາຂາຍ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17))),
                  SizedBox(
                      width: 60,
                      child: Text('ຈຳນວນ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17))),
                  SizedBox(
                      width: 80,
                      child: Text('ລາຄາ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 50,
                                            width: 60,
                                            child: Text('${index + 1}')),
                                        SizedBox(
                                            height: 50,
                                            width: 80,
                                            child: Text(
                                                '${order.Order_detill[index].Product!.nameProduct}')),
                                        SizedBox(
                                            height: 50,
                                            width: 80,
                                            child: Text(
                                                '${order.Order_detill[index].Product!.category_id}')),
                                        SizedBox(
                                            height: 50,
                                            width: 80,
                                            child: Text(
                                                '${NumberFormat.decimalPattern().format(order.Order_detill[index].Product!.price)}')),
                                        SizedBox(
                                            height: 50,
                                            width: 60,
                                            child: Text(
                                                '${order.Order_detill[index].amout}')),
                                        SizedBox(
                                            height: 50,
                                            width: 80,
                                            child: Text(
                                                '${NumberFormat.decimalPattern().format(order.Order_detill[index].sum)}')),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: order.Order_detill.length),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'ຈຳນວນລວມ : ${order.Curren_Order!.amouttotal} ເເກັດ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' ລາຄາລວມ : ${NumberFormat.decimalPattern().format(order.Curren_Order!.sumtotal)} ກີບ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: element.main),
                  child: const Text('ບັນທຶກເປັນພີດີເອຟ'),
                  onPressed: () async {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
