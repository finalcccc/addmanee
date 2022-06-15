// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled1/screen/product_add/reportData.dart';
import 'package:untitled1/screen/showDataFromFirebase/reportIncomeMonth.dart';

import '../../WidgetSearch/widgetSearch.dart';
import '../../celement/elements.dart';

class ReportIncome extends StatefulWidget {
  const ReportIncome({Key? key}) : super(key: key);

  @override
  State<ReportIncome> createState() => _ReportIncomeState();
}

final List items = List.generate(3, (i) => "Item $i");

class _ReportIncomeState extends State<ReportIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານລາຍຮັບ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ReportData()),
        bottom: WidgetSearch(label: "ວັນ ເດືອນ ປີ"),
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
                    builder: (context) => const ReportIncomeMonth()));
          },
        ),
      ),
    );
  }
}
