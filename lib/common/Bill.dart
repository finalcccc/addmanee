
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:untitled1/notifire/purchase_order_Notifire.dart';

import 'package:pdf/widgets.dart' as pw;
import 'dart:io';



class Bill{

  static save_Bill (purchase_order_Notifire orderadmin,context)async{
    final font  =await rootBundle.load('lib/assets/Phetsarath-Regular.ttf');
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context ) {
          return pw.Column(
              children:[
                pw.Text('${orderadmin.Currenorderaddmin!.NameSupplier}',style: pw.TextStyle(font: ttf)),
                pw.Text('${orderadmin.Currenorderaddmin!.id}'),
              ]
          ); // Center
        }));

    int randomNumber = Random().nextInt(90) + 10;
    String date = await orderadmin.Currenorderaddmin!.date!.toDate().toString();
    String result =date.substring(2,11);
    print(result);
    final File file = await File('/storage/emulated/0/Download/${orderadmin.Currenorderaddmin!.NameSupplier}$result$randomNumber.pdf');
    print(file);
    await file.writeAsBytes(await pdf.save()).then((value){
        OpenFile.open('${file.path}');
    });

  }
}

