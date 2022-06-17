// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/Getrepoert/get_reportl_income.dart';
import 'package:untitled1/notifire/Repport_incomNotifire.dart';
import 'package:untitled1/report/reportData.dart';
import 'package:untitled1/report/reportIncomeMonth.dart';
import '../WidgetSearch/widgetSearch.dart';
import '../celement/elements.dart';


class ReportIncome extends StatefulWidget {
  const ReportIncome({Key? key}) : super(key: key);

  @override
  State<ReportIncome> createState() => _ReportIncomeState();
}

final List items = List.generate(3, (i) => "Item $i");

class _ReportIncomeState extends State<ReportIncome> {
  @override
  Widget build(BuildContext context) {
    report_incomeNotifire income =Provider.of<report_incomeNotifire>(context);
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
              margin: EdgeInsets.only(right: 10,left: 10),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                                        ' ${index+2}0.520.000 ',
                                        style: TextStyle(fontSize: 16,color: element.main),
                                      ),
                                      Text('ກີບ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                                    ],
                                  ),
                                  Icon(Icons.arrow_forward_ios_sharp,size: 14)
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                onTap: () {
                  Get_reportl_income(income);
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
