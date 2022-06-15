// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:untitled1/screen/detialOfdata/reportIncomeDay.dart';
import 'package:untitled1/screen/product_add/reportIncome.dart';

import '../../WidgetSearch/widgetSearch.dart';
import '../../celement/elements.dart';

class ReportIncomeMonth extends StatefulWidget {
  const ReportIncomeMonth({Key? key}) : super(key: key);

  @override
  State<ReportIncomeMonth> createState() => _ReportIncomeMonthState();
}

final List items = List.generate(4, (i) => "Item $i");

class _ReportIncomeMonthState extends State<ReportIncomeMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານລາຍຮັບປະຈຳເດືອນ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ReportIncome()),
        bottom: WidgetSearch(label: "ວັນ ເດືອນ ປີ"),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.all(20),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'ເດືອນ: 01/2022',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('ວັນທີ: ${index+1}/01/2022'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children:  [
                                    Text(
                                      'ລາຍທັງໝົດ:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      ' ${index+1}.520.000 ກີບ',
                                      style: TextStyle(fontSize: 16),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReportIncomeDay()));
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
