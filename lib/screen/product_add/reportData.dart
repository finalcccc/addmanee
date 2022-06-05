import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportData extends StatefulWidget {
  const ReportData({Key? key}) : super(key: key);

  @override
  State<ReportData> createState() => _ReportDataState();
}

class _ReportDataState extends State<ReportData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານຂໍ້ມູນ'),
        centerTitle: true,
      ),
    );
  }
}
