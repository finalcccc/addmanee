import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:untitled1/notifire/purchase_order_Notifire.dart';

import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:math';

class Bill{

  static save_Bill (purchase_order_Notifire orderadmin)async{
  final font  =await rootBundle.load('lib/assets/Phetsarath-Regular.ttf');
  final ttf = Font.ttf(font);
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('ນະຈະ', style: pw.TextStyle(font: ttf, fontSize: 40)),
          ); // Center
        }));

    int randomNumber = Random().nextInt(90) + 10;
    String date = await orderadmin.Currenorderaddmin!.date!.toDate().toString();
    String result =date.substring(2,11);
    print(result);
    final File file = await File('/storage/emulated/0/Download/${orderadmin.Currenorderaddmin!.NameSupplier}$result$randomNumber.pdf');
    print(file);
    await file.writeAsBytes(await pdf.save());

  }
}