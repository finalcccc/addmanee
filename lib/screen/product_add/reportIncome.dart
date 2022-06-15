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
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.all(10),
              child: InkWell(
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'ເດືອນ: 0${index + 1}/2022',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children:  [
                                  Text(
                                    'ລາຍຮັບທັງໝົດ:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    ' ${index+2}0.520.000 ກີບ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReportIncomeMonth()));
                },
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
