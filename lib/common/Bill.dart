// ignore_for_file: non_constant_identifier_names, await_only_futures, avoid_print, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:math';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:untitled1/notifire/purchase_order_Notifire.dart';

import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

import 'package:untitled1/notifire/supplierNotifire.dart';

class Bill {
  static save_Bill(purchase_order_Notifire orderadmin, context,
      SupplierNotifire supp) async {
    final font = await rootBundle.load('lib/assets/Phetsarath-Regular.ttf');
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            margin: const pw.EdgeInsets.all(10),
            child: pw.Column(
              children: [
                pw.Text(
                  'ຮ້ານແອັດມານີ',
                  style: pw.TextStyle(
                      fontSize: 30, fontWeight: pw.FontWeight.bold, font: ttf),
                ),
                pw.Text(
                  'ໃບສັ່ງຊື້ສິນຄ້າ',
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold, font: ttf),
                ),
                pw.SizedBox(height: 40),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(children: [
                            pw.Text(
                              'ລະຫັດ: ',
                              style: pw.TextStyle(font: ttf),
                            ),
                            pw.Text('${supp.CurrentSupplier!.id}'),
                          ]),
                          pw.Row(children: [
                            pw.Text('ຊື່ຜູ້ສະໜອງ: ',
                                style: pw.TextStyle(font: ttf)),
                            pw.Text(
                              '${supp.CurrentSupplier!.name}',
                            ),
                          ]),
                          pw.Row(
                            children: [
                              pw.Text(
                                'ເບີໂທ: ',
                                style: pw.TextStyle(font: ttf),
                              ),
                              pw.Text('${supp.CurrentSupplier!.tel}'),
                            ],
                          ),
                          pw.Row(children: [
                            pw.Text(
                              'ອີເມວ: ',
                              style: pw.TextStyle(font: ttf),
                            ),
                            pw.Text('${supp.CurrentSupplier!.email}'),
                          ]),
                          pw.Row(
                            children: [
                              pw.Text(
                                'ທີ່ຢູ່: ',
                                style: pw.TextStyle(font: ttf),
                              ),
                              pw.Text('${supp.CurrentSupplier!.address}'),
                            ],
                          )
                        ],
                      ),
                    ),
                    pw.Text(
                      'ວັນທີ ເດືອນ ປີ: ${orderadmin.Currenorderaddmin!.date!.toDate()}',
                      style: pw.TextStyle(font: ttf),
                    ),
                  ],
                ),
                pw.SizedBox(height: 40),
                pw.Center(
                    child: pw.Row(
                  children: [
                    pw.Text('ລຳດັບ', style: pw.TextStyle(font: ttf)),
                    pw.SizedBox(width: 50),
                    pw.Text('ຊື່ສິນຄ້າ', style: pw.TextStyle(font: ttf)),
                    pw.SizedBox(width: 50),
                    pw.Text('ປະເພດສິນຄ້າ', style: pw.TextStyle(font: ttf)),
                    pw.SizedBox(width: 50),
                    pw.Text('ຈຳນວນ', style: pw.TextStyle(font: ttf)),
                    pw.SizedBox(width: 50),
                    pw.Text('ລາຄາ', style: pw.TextStyle(font: ttf)),
                    pw.SizedBox(width: 50),
                    pw.Text('ລາຄາລວມ', style: pw.TextStyle(font: ttf)),
                  ],
                )),
                pw.Center(
                  child: pw.ListView.builder(
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return pw.Center(
                            child: pw.Row(
                          children: [
                            pw.Text('${index}', style: pw.TextStyle(font: ttf)),
                            pw.SizedBox(width: 50),
                            pw.Text(
                                '${orderadmin.Productditill[index].nameProduct}',
                                style: pw.TextStyle(font: ttf)),
                            pw.SizedBox(width: 50),
                            pw.Text(
                                '${orderadmin.Productditill[index].category}',
                                style: pw.TextStyle(font: ttf)),
                            pw.SizedBox(width: 50),
                            pw.Text('${orderadmin.Dettil[index].amout}',
                                style: pw.TextStyle(font: ttf)),
                          ],
                        ));
                      },
                      itemCount: orderadmin.Productditill.length),
                ),
                pw.Row(children: [
                  pw.Text('ຈຳນວນລວມ:', style: pw.TextStyle(font: ttf)),
                  pw.Text('${orderadmin.Currenorderaddmin!.amouttotal}',
                      style: pw.TextStyle(font: ttf)),
                ])
              ],
            ),
          );
        },
      ),
    );

    int randomNumber = Random().nextInt(90) + 10;
    String date = await orderadmin.Currenorderaddmin!.date!.toDate().toString();
    String result = date.substring(2, 11);
    print(result);
    final File file = await File(
        '/storage/emulated/0/Download/$randomNumber${supp.CurrentSupplier!.name}$result.pdf');
    print(file);
    await file.writeAsBytes(await pdf.save()).then((value) {
      OpenFile.open('${file.path}');
    });
  }
}
