import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/screen/product_add/reportExpense.dart';
import 'package:untitled1/screen/product_add/reportIncome.dart';

import '../menu.dart';

class ReportData extends StatefulWidget {
  const ReportData({Key? key}) : super(key: key);

  @override
  State<ReportData> createState() => _ReportDataState();
}

class _ReportDataState extends State<ReportData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານຂໍ້ມູນ'),
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
                    style: ElevatedButton.styleFrom(primary: element.main),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReportIncome()));
                    },
                    child: const Text(
                      'ລາຍງານລາຍຮັບ',
                      style: TextStyle(fontSize: 17),
                    )),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: element.main),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportExpense()));
                  },
                  child: const Text(
                    'ລາຍງານລາຍຈ່າຍ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
