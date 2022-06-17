import 'package:flutter/material.dart';
import 'package:untitled1/report/reportData.dart';
import '../WidgetSearch/widgetSearch.dart';
import '../celement/elements.dart';
import 'reportExpenseMonth.dart';

class ReportExpense extends StatefulWidget {
  const ReportExpense({Key? key}) : super(key: key);

  @override
  State<ReportExpense> createState() => _ReportExpenseState();
}

final List items = List.generate(3, (i) => "Item $i");

class _ReportExpenseState extends State<ReportExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານລາຍຈ່າຍ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ReportData()),
        bottom: WidgetSearch(label: "ວັນ ເດືອນ ປີ"),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            //  margin: const EdgeInsets.only(right: 10,left: 10),
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                          subtitle: Column(

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        ' - ${index + 1}1.140.000 ',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
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
                          ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReportExpenseMonth()));
                },
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox();
        },
      ),
    );
  }
}
