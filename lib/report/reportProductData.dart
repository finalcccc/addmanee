import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/productNotifire.dart';
import 'package:untitled1/report/buttonReportData.dart';
import 'package:untitled1/report/reportProductDataToPDF.dart';
import '../celement/elements.dart';

class ReportProductData extends StatefulWidget {
  const ReportProductData({Key? key}) : super(key: key);

  @override
  State<ReportProductData> createState() => _ReportProductDataState();
}

class _ReportProductDataState extends State<ReportProductData> {
  @override
  Widget build(BuildContext context) {
    ProductNotifire pro = Provider.of<ProductNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານຂໍ້ມູນສິນຄ້າ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ReportData()),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text('ຂໍ້ມູນສິນຄ້າ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: pro.Products.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${pro.Products[index].nameProduct}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '${pro.Products[index].amount}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '${pro.Products[index].category_id}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '${pro.Products[index].price}',
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
            children:  [
              Text('ມີທັ້ງໝົດ: ${pro.Products.length} ລາຍການ', style: TextStyle(fontSize: 17)),
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
                              const ReportProductDataToPDF()));
                },
                child: const Text(
                  'ບັນທຶກເປັນພີດີເອັຟ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )),
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
