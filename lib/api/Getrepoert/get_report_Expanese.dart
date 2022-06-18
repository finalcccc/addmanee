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
      .where('date', isGreaterThanOrEqualTo: DateTime(DateTime.now().year, 1))
      .get();
  m1.clear();
  Expanese.expanese.clear();
  rfn.docs.forEach((element) async {
    Timestamp g = element['date'];

    String m = g.toDate().toString().substring(6, 7);
    Report_Month(
        m: m, Month: Month, sumtotal: sumtotal, g: g, element: element);
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

Get_reportl_Expanese_day(report_incomeNotifire expanese) async {
  List<Report_income> m1 = [];
  List<num> sumtotal = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  List<Timestamp> Day = [
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
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
  ];
  List<String> year_M_D =
      expanese.curren_expanese!.date!.toDate().toString().split('-');
  DateTime stars = DateTime(
    int.parse(year_M_D[0]),
    int.parse(year_M_D[1]),
  );
  Timestamp? end = expanese.curren_expanese!.date;
  print(end!.toDate());
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection("importproducts")
      .where('date', isGreaterThan: stars)
      .where('date', isLessThanOrEqualTo: end)
      .get();
  m1.clear();
  rfn.docs.forEach((element) async {
    Timestamp g = element['date'];
    // print('${g.toDate()}');
    String m = g.toDate().toString().substring(8, 10);
    Report_Day(m: m, Day: Day, sumtotal: sumtotal, g: g, element: element);
  });
  int i = 0;
  for (var shan in Day) {
    if (sumtotal[i] != 0) {
      Report_income m5 = Report_income(
          sumtatall: int.parse(sumtotal[i].toString()), date: Day[i]);
      m1.add(m5);
      expanese.expanese_day = m1;
      expanese.Refresh();
    }
    i++;
  }
}
