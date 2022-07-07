import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportEmployeeDataToPDF extends StatefulWidget {
  const ReportEmployeeDataToPDF({Key? key}) : super(key: key);

  @override
  State<ReportEmployeeDataToPDF> createState() =>
      _ReportEmployeeDataToPDFState();
}

class _ReportEmployeeDataToPDFState extends State<ReportEmployeeDataToPDF> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PDF'),
      ),
    );
  }
}
