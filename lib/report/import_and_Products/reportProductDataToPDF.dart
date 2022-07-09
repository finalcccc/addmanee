import 'package:flutter/material.dart';

class ReportProductDataToPDF extends StatefulWidget {
  const ReportProductDataToPDF({Key? key}) : super(key: key);

  @override
  State<ReportProductDataToPDF> createState() => _ReportProductDataToPDFState();
}

class _ReportProductDataToPDFState extends State<ReportProductDataToPDF> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PDF'),
      ),
    );
  }
}
