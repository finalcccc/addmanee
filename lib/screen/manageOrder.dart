import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/get_Order.dart';
import 'package:untitled1/notifire/OrderNotifire.dart';
import 'package:untitled1/screen/detialOfdata/managerOrderByAdmin.dart';
import 'package:untitled1/screen/detialOfdata/managerOrderByCustomer.dart';
import 'package:untitled1/screen/menu.dart';

import '../celement/elements.dart';

class ManageOrder extends StatefulWidget {
  const ManageOrder({Key? key}) : super(key: key);

  @override
  State<ManageOrder> createState() => _ManageOrderState();
}

late double sreenWidth, sreenHeight;

class _ManageOrderState extends State<ManageOrder> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    Order_Notifire Order = Provider.of<Order_Notifire>(context);
    sreenWidth = MediaQuery.of(context).size.width;
    sreenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('ຈັດການອໍເດີ້'),
                centerTitle: true,
                backgroundColor: element.main,
                leading: element().RoutePageBack(context, const Menu()),
              ),
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      color: element.main,
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: element.main),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ManagerOrderByAdmin()),
                            );
                          },
                          child: const Text(
                            'ສັ່ງຊື້ສິນຄ້າເຂົ້າຮ້ານ',
                            style: TextStyle(fontSize: 17),
                          )),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: element.main),
                        onPressed: () {
                          Get_Order(Order);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ManagerOrderByCustomer()));
                        },
                        child: const Text(
                          'ລູກຄ້າສັ່ງຊື້ສິນຄ້າ',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              )));
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
