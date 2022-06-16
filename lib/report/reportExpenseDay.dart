// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled1/report/reportExpenseMonth.dart';

import '../WidgetSearch/widgetSearch.dart';
import '../celement/elements.dart';

class ReportExpenseDay extends StatefulWidget {
  const ReportExpenseDay({Key? key}) : super(key: key);

  @override
  State<ReportExpenseDay> createState() => _ReportExpenseDayState();
}

class _ReportExpenseDayState extends State<ReportExpenseDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານລາຍຈ່າຍຂອງແຕ່ລະມື້'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ReportExpenseMonth()),
          bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນລາຍຈ່າຍແຕ່ລະມື້"),
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
                        Text('amnong xaych uevang'),
                        Text('amnong xaychuevang'),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
