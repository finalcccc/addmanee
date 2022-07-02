// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/Getrepoert/get_report_Expanese.dart';
import 'package:untitled1/api/Getrepoert/get_reportl_income.dart';
import 'package:untitled1/notifire/Repport_Notifire.dart';
import 'package:untitled1/report/reportData.dart';
import 'package:untitled1/report/reportExpenseMonth.dart';
import 'package:untitled1/report/reportIncomeMonth.dart';
import '../WidgetSearch/widgetSearch.dart';
import '../celement/elements.dart';
import 'package:intl/intl.dart';


class ReportExpense extends StatefulWidget {
  const ReportExpense({Key? key}) : super(key: key);

  @override
  State<ReportExpense> createState() => _ReportExpenseState();
}

final List items = List.generate(3, (i) => "Item $i");

class _ReportExpenseState extends State<ReportExpense> {
  @override
  Widget build(BuildContext context) {
    report_incomeNotifire Expanese =Provider.of<report_incomeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານລາຍຈ່າຍ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ReportData()),
        bottom: WidgetSearch(label: 'ປີ - ເດືອນ/2000-01',type: 'exp',notifire: Expanese),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: Expanese.expanese.length,
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
                                'ວັນທີ: ${Expanese.expanese[Expanese.expanese.length-index-1].date!.toDate().toString().substring(0,7)}'),
                            subtitle: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          ' - ${NumberFormat.decimalPattern().format(Expanese.expanese[Expanese.expanese.length-index-1].sumtatall)}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ກີບ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child:Icon(Icons.arrow_forward_ios_sharp,size: 14),
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
                 Expanese.curren_expanese = Expanese.expanese[Expanese.expanese.length-index-1];
                     Get_reportl_Expanese_day(Expanese);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const  ReportExpenseMonth()));
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
