// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled1/screen/detialOfdata/reportExpenseDay.dart';
import 'package:untitled1/screen/product_add/reportData.dart';

import '../../WidgetSearch/widgetSearch.dart';
import '../../celement/elements.dart';

class ReportExpenseMonth extends StatefulWidget {
  const ReportExpenseMonth({Key? key}) : super(key: key);

  @override
  State<ReportExpenseMonth> createState() => _ReportExpenseMonthState();
}

class _ReportExpenseMonthState extends State<ReportExpenseMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານລາຍຈ່າຍເປັນເດືອນ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ReportData()),
          bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນລາຍຈ່າຍເປັນເດືອນ"),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 120,
            child: InkWell(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'ເດືອນ ປີ: 10-2022',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'ລາຍຈ່າຍປະຈຳເດືອນທັງໝົດແມ່ນ: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                '9.620.000 ກີບ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportExpenseDay()));
              },
            )));
  }
}
