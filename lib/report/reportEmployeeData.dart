import 'package:flutter/material.dart';
import 'package:untitled1/report/reportData.dart';
import '../celement/elements.dart';

class ReportEmployeeData extends StatefulWidget {
  const ReportEmployeeData({Key? key}) : super(key: key);

  @override
  State<ReportEmployeeData> createState() => _ReportEmployeeDataState();
}

class _ReportEmployeeDataState extends State<ReportEmployeeData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານຂໍ້ມູນພະນັກງານ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ReportData()),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            const Text('ພະນັກງານທັງໝົດມີ ຄົນ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${"$index"} user',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            'email',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('ແອັດມິນມີ 2 ຄົນ', style: TextStyle(fontSize: 17)),
                Text('ພະນັກງານຂາຍມີ 15 ຄົນ', style: TextStyle(fontSize: 17)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              width: double.maxFinite,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'ບັນທຶກເປັນພີດີເອັຟ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
            ),
            const SizedBox(height: 60)
          ],
        ));
  }
}
