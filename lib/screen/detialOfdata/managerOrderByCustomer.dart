import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Order_detill/View_order_cutommer.dart';
import 'package:untitled1/api/get_Order.dart';
import 'package:untitled1/notifire/OrderNotifire.dart';
import 'package:untitled1/screen/manageOrder.dart';
import 'package:untitled1/celement/elements.dart';

import '../../api/UploadData/Upload_Data_phuasOrder.dart';
import '../../notifire/purchase_order_Notifire.dart';
import '../../notifire/supplierNotifire.dart';
import 'managerOrderByAdmin.dart';
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
            padding: const EdgeInsets.only(top:10.0),
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      order.Curren_Order=order.Order[index];
                      Get_Order_Detlill(order);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const view_order()));
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('ລະຫັດ: '
                                  ' ${order.Order[index].id}            '),
                              Text(
                                ' ${order.Order[index].date!.toDate().toString().substring(0,10)}',style: const TextStyle(fontWeight: FontWeight.bold),),
                            ],),
                          Text('ຈຳນວນ: '
                              ' ${order.Order[index].Ditell.length} ລາຍການ'),
                          Text('ຈຳນວນທັງໝົດ: '
                              ' ${order.Order[index].amouttotal} ແກັດ'),
                          Text('ລາຄາທັ້ງໝົດ: '
                              ' ${order.Order[index].sumtotal} ກີບ'),

                          Text('ຊື່ລູກຄ້າ: '
                              ' ${order.Order[index].nameCutommer} ແກັດ'),
                          Text('ເບີໂທ: '
                              ' ${order.Order[index].tel} '),
                          Text('ທີ່ຢູ່: '
                              ' ${order.Order[index].address}'),

                        ]),
                  )),
            ),
          );
        },
      )
    );
  }
}
