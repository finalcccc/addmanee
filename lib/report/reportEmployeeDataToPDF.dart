// ignore_for_file: non_constant_identifier_names, await_only_futures, avoid_print, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, camel_case_types, depend_on_referenced_packages

import 'dart:math';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:untitled1/notifire/employeeNotifire.dart';

class EmployeePDF {
  static SaveEmployeePDF(EmployeeNotifire emp, context) async {
    final font = await rootBundle.load('lib/assets/Phetsarath-Regular.ttf');
    final pw.Font ttf = pw.Font.ttf(font);
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
                  'ຮ້ານແອັດມະນີ',
                  style: pw.TextStyle(
                      fontSize: 25, fontWeight: pw.FontWeight.bold, font: ttf),
                ),
                pw.Text(
                  'ລາຍງານຂໍ້ມູນພະນັກງານ',
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold, font: ttf),
                ),
                pw.Text(
                  '${emp.employeeList.length}',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold, font: ttf),
                ),
                pw.Text(
                  '${emp.addminCount}',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold, font: ttf),
                ),
                pw.Text(
                  '${emp.saleCount}',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold, font: ttf),
                ),
                pw.SizedBox(height: 50),
                pw.Center(
                  child: pw.Text(
                    'ລາຍລະອຽດຂອງພະນັກງານ',
                    style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                        font: ttf),
                  ),
                ),
                pw.Divider(),
                Subtitle_Purchase_Order_Detail(ttf),
                pw.Divider(),
                pw.ListView.builder(
                  itemCount: emp.employeeList.length,
                  itemBuilder: (context, index) {
                    return pw.Column(children: [
                      pw.Row(children: [
                        pw.Text(
                          '${index + 1}',
                          style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              font: ttf),
                        ),
                        pw.Text(
                          '${emp.employeeList[index].name}',
                          style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              font: ttf),
                        ),
                        pw.Text(
                          '${emp.employeeList[index].id}',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          '${emp.employeeList[index].position}',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          '${emp.employeeList[index].tel}',
                          style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              font: ttf),
                        ),
                        pw.Text(
                          '${emp.employeeList[index].email}',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          '${emp.employeeList[index].address}',
                          style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              font: ttf),
                        ),
                      ])
                    ]);
                  },
                ),
                pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 0, top: 20),
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text('ລາຍເຊັນ ອະນຸມັດ',
                              style: pw.TextStyle(
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 15)),
                          pw.Text('.........................................'),
                          pw.Text('ລາຍເຊັນ ຮັບເຄື່ອງ',
                              style: pw.TextStyle(
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 15)),
                          pw.Text('.........................................'),
                        ]))
              ],
            ),
          );
        },
      ),
    );

    int randomNumber = Random().nextInt(90) + 10;
    String date = await emp.CurrentEmployee_loco!.date!.toDate().toString();
    String result = date.substring(2, 11);
    print(result);
    final File file =
        await File('/storage/emulated/0/Download/$randomNumber$result.pdf');
    print(file);
    await file.writeAsBytes(await pdf.save()).then((value) {
      OpenFile.open('${file.path}');
    });
  }

  static pw.Row Subheader_Purchase_OrderDetial(
      pw.Font ttf, EmployeeNotifire emp) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(children: [
                pw.Text(
                  'ລະຫັດໃບບິນ:',
                  style: pw.TextStyle(font: ttf),
                ),
                pw.Text('${emp.CurrentEmployee_loco!.id}'),
              ]),
              pw.Row(children: [
                pw.Text('ຊື່ຜູ້ຮັບ: ', style: pw.TextStyle(font: ttf)),
                pw.Text('${emp.CurrentEmployee_loco!.name}',
                    style: pw.TextStyle(font: ttf)),
              ]),
              pw.Row(
                children: [
                  pw.Text(
                    'ເບີໂທ: ',
                    style: pw.TextStyle(font: ttf),
                  ),
                  pw.Text('${emp.CurrentEmployee!.tel}'),
                ],
              ),
              pw.Row(
                children: [
                  pw.Text(
                    'ທີ່ຢູ່: ',
                    style: pw.TextStyle(font: ttf),
                  ),
                  pw.Text('${emp.CurrentEmployee!.address}',
                      style: pw.TextStyle(font: ttf)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Row Subtitle_Purchase_Order_Detail(pw.Font ttf) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
      children: [
        pw.Container(
          width: 70,
          child: pw.Text('ລຳດັບ', style: pw.TextStyle(font: ttf)),
        ),
        pw.Container(
          width: 70,
          child: pw.Text('ຊີ່', style: pw.TextStyle(font: ttf)),
        ),
        pw.Container(
          width: 70,
          child: pw.Text('ລະຫັດພະນັກງານ', style: pw.TextStyle(font: ttf)),
        ),
        pw.Container(
          width: 70,
          child: pw.Text('ຕຳແຫນ່ງ', style: pw.TextStyle(font: ttf)),
        ),
        pw.Container(
          width: 70,
          child: pw.Text('ເບີໂທ', style: pw.TextStyle(font: ttf)),
        ),
        pw.Container(
          width: 70,
          child: pw.Text('ອີເມວ', style: pw.TextStyle(font: ttf)),
        ),
        pw.Container(
          width: 70,
          child: pw.Text('ທີ່ຢູ່', style: pw.TextStyle(font: ttf)),
        ),
      ],
    );
  }

  static pw.ListView Detail_Purchase_Order(pw.Font ttf, EmployeeNotifire emp) {
    return pw.ListView.builder(
        itemBuilder: (
          context,
          index,
        ) {
          return pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            children: [
              pw.SizedBox(height: 5),
              pw.Container(
                width: 70,
                child: pw.Text('${index + 1}', style: pw.TextStyle(font: ttf)),
              ),
              pw.Container(
                width: 70,
                child: pw.Text('${emp.employeeList[index].name}',
                    style: pw.TextStyle(font: ttf)),
              ),
              pw.Container(
                width: 70,
                child: pw.Text('${emp.employeeList[index].id}',
                    style: pw.TextStyle(font: ttf)),
              ),
              pw.Container(
                width: 70,
                child: pw.Text('ເເກັດ', style: pw.TextStyle(font: ttf)),
              ),
            ],
          );
        },
        itemCount: emp.employeeList.length);
  }
}
