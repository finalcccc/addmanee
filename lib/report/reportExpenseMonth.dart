// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:untitled1/report/reportIncomeDay.dart';
import 'package:untitled1/report/reportExpense.dart';
import 'package:untitled1/report/reportIncome.dart';

import '../WidgetSearch/widgetSearch.dart';
import '../celement/elements.dart';

class ReportExpenseMonth extends StatefulWidget {
  const ReportExpenseMonth({Key? key}) : super(key: key);

  @override
  State<ReportExpenseMonth> createState() => _ReportExpenseMonthState();
}

final List items = List.generate(4, (i) => "Item $i");

class _ReportExpenseMonthState extends State<ReportExpenseMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານລາຍຈ່າຍປະຈຳເດືອນ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ReportExpense()),
          bottom: WidgetSearch(label: "ວັນ ເດືອນ ປີ"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    ' ເດືອນ: 1/2022',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(right: 10,left: 10),
                      child: InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('ວັນທີ: ${index + 1}/01/2022'),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'ລາຍຈ່າຍທັງໝົດ:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              ' - ${index + 1}.520.000 ',
                                              style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),
                                            ),
                                            Text('ກີບ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
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
                                  builder: (context) =>
                                  const ReportIncomeDay()));
                        },
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox();
                },
              ),
            )
          ],
        ));
  }
}
