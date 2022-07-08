// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/Getrepoert/get_report_Expanese.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/employeeNotifire.dart';
import 'package:untitled1/report/reportEmployeeData.dart';
import 'package:untitled1/report/reportExpense.dart';
import 'package:untitled1/report/reportImportProduct.dart';
import 'package:untitled1/report/reportIncome.dart';
import 'package:untitled1/report/reportProductData.dart';

import '../api/Getrepoert/get_reportl_income.dart';
import '../api/getEmployeeData.dart';
import '../notifire/Repport_Notifire.dart';
import '../screen/menu.dart';

class ReportData extends StatefulWidget {
  const ReportData({Key? key}) : super(key: key);

  @override
  State<ReportData> createState() => _ReportDataState();
}

class _ReportDataState extends State<ReportData> {
  @override
  Widget build(BuildContext context) {
    report_incomeNotifire income = Provider.of<report_incomeNotifire>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລາຍງານຂໍ້ມູນ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const Menu()),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                color: element.main,
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: element.main),
                    onPressed: () {
                      Get_reportl_income(income);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReportIncome()));
                    },
                    child: const Text(
                      'ລາຍງານລາຍຮັບ',
                      style: TextStyle(fontSize: 17),
                    )),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: element.main),
                  onPressed: () {
                    Get_reportl_Expanese(income);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportExpense()));
                  },
                  child: const Text(
                    'ລາຍງານລາຍຈ່າຍ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: element.main),
                  onPressed: () async {
                    EmployeeNotifire emp =
                        Provider.of<EmployeeNotifire>(context, listen: false);
                    await GetEmployeeData(emp);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportEmployeeData()));
                  },
                  child: const Text(
                    'ລາຍງານຂໍ້ມູນພະນັກງານ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: element.main),
                  onPressed: () {
                    Get_reportl_Expanese(income);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportImportProduct()));
                  },
                  child: const Text(
                    'ລາຍງານໃບນຳສົ່ງສິນຄ້າ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: element.main),
                  onPressed: () {
                    Get_reportl_Expanese(income);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportProductData()));
                  },
                  child: const Text(
                    'ລາຍງານຂໍ້ມູນສິນຄ້າ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
