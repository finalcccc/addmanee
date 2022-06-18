import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/notifire/Repport_Notifire.dart';

import '../../model/Report_Income_Modle.dart';
import 'get_reportl_income.dart';

Get_reportl_Expanese(report_incomeNotifire Expanese) async {
  List<Report_income> m1 = [];
  List<num> sumtotal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<Timestamp> Month = [
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
  ];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection("importproducts")
      //.where('date', isGreaterThanOrEqualTo: DateTime(DateTime.now().year, 1))
      .get();
  m1.clear();
  Expanese.expanese.clear();
  rfn.docs.forEach((element) async {
    Timestamp g = element['date'];
    print(element.data());
    String m = g.toDate().toString().substring(6, 7);
      Report_Month(m: m, Month: Month, sumtotal: sumtotal, g: g, element: element);
  });
  int i = 0;
  for (var shan in Month) {
    if (Month[i] != Timestamp(1, 1)) {
      Report_income m5 = Report_income(
          sumtatall: int.parse(sumtotal[i].toString()), date: Month[i]);
      m1.add(m5);
      Expanese.expanese = m1;
      Expanese.Refresh();
    }
    i++;
  }
}