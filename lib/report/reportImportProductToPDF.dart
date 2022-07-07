import 'package:flutter/material.dart';

class ReportImportProductToPDF extends StatefulWidget {
  const ReportImportProductToPDF({Key? key}) : super(key: key);

  @override
  State<ReportImportProductToPDF> createState() =>
      _ReportImportProductToPDFState();
}

class _ReportImportProductToPDFState extends State<ReportImportProductToPDF> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PDF'),
      ),
    );
  }
}
