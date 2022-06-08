import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
                title: const Text('ສັ່ງຊື້ສິນຄ້າ'),
                centerTitle: true,
                backgroundColor: element.main,
                leading: element().RoutePageBack(context, const Menu()),
              ),
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                child: Column(
                  children: [
                    const Text(
                      'ສັ່ງຊື້ສິນຄ້າ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ManagerOrderByAdmin()),
                          );
                        },
                        child: const Text('ສັ່ງຊື້ສິນຄ້າເຂົ້າຮ້ານ')),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ManagerOrderByCustomer()));
                      },
                      child: const Text('ລູກຄ້າສັ່ງຊື້ສິນຄ້າ'),
                    ),
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
