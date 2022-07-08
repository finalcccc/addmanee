import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';
import 'package:untitled1/report/buttonReportData.dart';
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
    SupplierNotifire supp = Provider.of<SupplierNotifire>(context);
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
                itemCount: supp.Supplier.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${index + 1} ',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            '${supp.ImportProduct[index].id}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${supp.Supplier[index].name}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${supp.ImportProduct[index].date!.toDate()}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${supp.SuplierList[index].tel}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${supp.SuplierList[index].email}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${supp.ImportProduct[index].amouttotal}',
                            style: const TextStyle(
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
