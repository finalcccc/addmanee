// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Order_detill/View_order_cutommer.dart';
import 'package:untitled1/api/Update%20status/Status.dart';
import 'package:untitled1/api/get_Order.dart';
import 'package:untitled1/notifire/OrderNotifire.dart';
import 'package:untitled1/screen/manageOrder.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:intl/intl.dart';

class ManagerOrderByCustomer extends StatefulWidget {
  const ManagerOrderByCustomer({Key? key}) : super(key: key);

  @override
  State<ManagerOrderByCustomer> createState() => _ManagerOrderByCustomerState();
}

class _ManagerOrderByCustomerState extends State<ManagerOrderByCustomer> {
  @override
  Widget build(BuildContext context) {
    Order_Notifire order = Provider.of<Order_Notifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລູກຄ້າສັ່ງຊື້ສິນຄ້າ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ManageOrder()),
      ),
      body: ListView.builder(
        itemCount: order.Order.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () async {
                    order.Curren_Order = order.Order[index];
                    Get_Order_Detlill(order);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const view_order()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ລະຫັດ: ${order.Order[index].id}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            '${order.Order[index].date!.toDate().toString().substring(0, 10)}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        'ຊື່ລູກຄ້າ: ${order.Order[index].nameCutommer} ແກັດ',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'ເບີໂທ: ${order.Order[index].tel} ',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'ຈຳນວນ: ${order.Order[index].Ditell.length} ລາຍການ',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'ຈຳນວນທັງໝົດ: ${order.Order[index].amouttotal} ແກັດ',
                        style: const TextStyle(fontSize: 16),
                      ),
                 Row(
                   children: [
                     Text(
                       'ລາຄາລວມ: ${NumberFormat.decimalPattern().format(order.Order[index].sumtotal)} ກີບ',
                       style: const TextStyle(fontSize: 16),
                     ),
                     const SizedBox(width: 120),
                     Staustus(order, index),
                   ],
                 )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget Staustus(Order_Notifire order, int index) {
    return order.Order[index].Staustus == 'ລໍຖ້າ'
        ? ElevatedButton(
            onPressed: () {
              order.Curren_Order = order.Order[index];
              update_Status(order);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('${order.Order[index].Staustus}'),
          )
        : ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('${order.Order[index].Staustus}'),
          );
  }
}
