// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
          title: const Text('ລາຍງານລາຍຮັບເປັນເດືອນ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ReportData()),
          bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນລາຍຮັບເປັນເດືອນ"),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 150,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text('amnong xaychuevang'),
                      ],
                    ),
                    Column(
                      children: const [
                        Text('amnong xaychuevang'),
                        Text('amnong xaychuevang'),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
