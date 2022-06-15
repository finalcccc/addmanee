// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled1/screen/detialOfdata/reportIncomeDay.dart';
import 'package:untitled1/screen/product_add/reportData.dart';

import '../../WidgetSearch/widgetSearch.dart';
import '../../celement/elements.dart';

class ReportIncomeMonth extends StatefulWidget {
  const ReportIncomeMonth({Key? key}) : super(key: key);

  @override
  State<ReportIncomeMonth> createState() => _ReportIncomeMonthState();
}

class _ReportIncomeMonthState extends State<ReportIncomeMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານລາຍຮັບປະຈຳເດືອນ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ReportData()),
          bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນລາຍຮັບປະຈຳເດືອນ"),
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
                              'ລາຍຮັບປະຈຳເດືອນທັງໝົດແມ່ນ: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              '12.620.000 ກີບ',
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
                      builder: (context) => const ReportIncomeDay()));
            },
          ),
        ));
  }
}
