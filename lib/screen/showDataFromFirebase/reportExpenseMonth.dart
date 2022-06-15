import 'package:flutter/material.dart';
import 'package:untitled1/screen/product_add/reportIncome.dart';

import '../../WidgetSearch/widgetSearch.dart';
import '../../celement/elements.dart';
import '../detialOfdata/reportExpenseDay.dart';

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
        leading: element().RoutePageBack(context, const ReportIncome()),
        bottom: WidgetSearch(label: "ວັນ ເດືອນ ປີ"),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.all(20),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'ເດືອນ: 01/2022',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('ວັນທີ: ${index + 1}/01/2022'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'ລາຍຈ່າຍທັງໝົດ:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      ' -${index + 1}.520.000 ກີບ',
                                      style: const TextStyle(fontSize: 16),
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
                          builder: (context) => const ReportExpenseDay()));
                },
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
