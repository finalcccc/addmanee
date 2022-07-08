// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/Getrepoert/get_reportl_income.dart';
import 'package:untitled1/notifire/Repport_Notifire.dart';
import 'package:untitled1/report/buttonReportData.dart';
import 'package:untitled1/report/reportIncomeMonth.dart';
import '../WidgetSearch/widgetSearch.dart';
import '../celement/elements.dart';
import 'package:intl/intl.dart';

class ReportIncome extends StatefulWidget {
  const ReportIncome({Key? key}) : super(key: key);

  @override
  State<ReportIncome> createState() => _ReportIncomeState();
}

final List items = List.generate(3, (i) => "Item $i");

class _ReportIncomeState extends State<ReportIncome> {
  @override
  Widget build(BuildContext context) {
    report_incomeNotifire income = Provider.of<report_incomeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານລາຍຮັບ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ReportData()),
        bottom: WidgetSearch(
            label: 'ປີ - ເດືອນ /2000-01', type: 'income', notifire: income),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: income.icome.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                                'ວັນທີ: ${income.icome[income.icome.length - index - 1].date!.toDate().toString().substring(0, 7)}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'ລາຍຮັບທັງໝົດ:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          ' ${NumberFormat.decimalPattern().format(income.icome[income.icome.length - index - 1].sumtatall)}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: element.main,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ' ກີບ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child: Icon(Icons.arrow_forward_ios_sharp,
                                          size: 14),
                                    )
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
                  income.curren_income =
                      income.icome[income.icome.length - index - 1];
                  Get_reportl_income_Month(income);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReportIncomeMonth()));
                },
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox();
        },
      ),
    );
  }
}
