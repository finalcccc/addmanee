// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled1/screen/showDataFromFirebase/reportIncomeMonth.dart';

import '../../WidgetSearch/widgetSearch.dart';
import '../../celement/elements.dart';

class ReportIncomeDay extends StatefulWidget {
  const ReportIncomeDay({Key? key}) : super(key: key);

  @override
  State<ReportIncomeDay> createState() => _ReportIncomeDayState();
}

final List items = List.generate(30, (i) => "Item $i");

class _ReportIncomeDayState extends State<ReportIncomeDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານລາຍຮັບຂອງແຕ່ລະມື້'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ReportIncomeMonth()),
        bottom: WidgetSearch(label: "ຄົ້ນຫາຂໍ້ມູນລາຍຮັບແຕ່ລະມື້"),
      ),
      // body:
      body: ListView.separated(
        //Show IOS pop-up when the list slides to the border
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        //List item builder
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'ວັນທີ: ${index + 1}-10-2022',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'ລາຍງານລາຍຮັບປະວຳວັນ:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(' 10.520.000 ກີບ'),
                            ],
                          ),
                          Row(
                            children: const [
                              Text('ຊື່ພະນັກງານ:',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(' ທ້າວ ໂຕນໄຊ ອິນປະເສີດ'),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        },

        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
