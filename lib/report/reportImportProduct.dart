import 'package:flutter/material.dart';
import 'package:untitled1/report/reportData.dart';
import 'package:untitled1/report/reportImportProductToPDF.dart';
import '../celement/elements.dart';

class ReportImportProduct extends StatefulWidget {
  const ReportImportProduct({Key? key}) : super(key: key);

  @override
  State<ReportImportProduct> createState() => _ReportImportProductState();
}

class _ReportImportProductState extends State<ReportImportProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານໃບນຳສົ່ງສິນຄ້າ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ReportData()),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            const Text('ໃບນຳສົ່ງສິນຄ້າ',
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
                            '${"$index"} Name',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            'type',
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
                Text('type:', style: TextStyle(fontSize: 17)),
                Text('amount:', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              width: double.maxFinite,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ReportImportProductToPDF()));
                  },
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
