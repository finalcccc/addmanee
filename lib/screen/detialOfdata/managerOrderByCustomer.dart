import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Order_detill/View_order_cutommer.dart';
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
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Card(
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
                              children: [ Text(
                                'ລະຫັດ: ${order.Order[index].id}',
                                style: const TextStyle(fontSize: 16),
                              ),
                                SizedBox(width: 30),
                                Text(
                                  '${order.Order[index].date!.toDate().toString().substring(0, 10)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
                            Text(
                              'ລາຄາລວມ: ${NumberFormat.decimalPattern().format(order.Order[index].sumtotal)} ກີບ',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ]),
                    )),
              ),
            );
          },
        ));
  }
}
