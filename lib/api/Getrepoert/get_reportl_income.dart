



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/Report_Income_Modle.dart';
import 'package:untitled1/notifire/Repport_incomNotifire.dart';

Get_reportl_income(report_incomeNotifire imcome)async{
  List<Report_income> m1 =[];
  num sumtotal_m6=0;
  num sumtotal_m5=0;
  String Month6 = '';
  String Month5 = '';
  // QuerySnapshot<Map<String,dynamic>> rfn = await FirebaseFirestore.instance.collection("order").where('date',isGreaterThan:DateTime(2022,6,16)).where('date',isLessThanOrEqualTo: DateTime(2022,6,17)).get();
  // m1.clear();
  QuerySnapshot<Map<String,dynamic>> rfn = await FirebaseFirestore.instance.collection("order").where('date',isGreaterThanOrEqualTo:DateTime(2022,1)).get();
  m1.clear();
  rfn.docs.forEach((element) async{

      Timestamp g =  element['date'];
      print(element['sumtotal']);
      print(g.toDate());
      String m = g.toDate().toString().substring(6,7);
      switch(m){
        case'12':
          Timestamp d = element['date'];
          Month5 = g.toDate().toString().substring(0,7);
          sumtotal_m5 +=element['sumtotal'];
          break;
        case'11':
          Timestamp d = element['date'];
          Month5 = g.toDate().toString().substring(0,7);
          sumtotal_m5 +=element['sumtotal'];
          break;
        case'10':
          Timestamp d = element['date'];
          Month5 = g.toDate().toString().substring(0,7);
          sumtotal_m5 +=element['sumtotal'];
          break;
        case'9':
          Timestamp d = element['date'];
          Month5 = g.toDate().toString().substring(0,7);
          sumtotal_m5 +=element['sumtotal'];
          break;
        case'8':
          Timestamp d = element['date'];
          Month5 = g.toDate().toString().substring(0,7);
          sumtotal_m5 +=element['sumtotal'];
          break;
        case'7':
          Timestamp d = element['date'];
          Month5 = g.toDate().toString().substring(0,7);
          sumtotal_m5 +=element['sumtotal'];
          break;
        case'6':{
          Timestamp d = element['date'];
          Month6 = g.toDate().toString().substring(0,7);
          sumtotal_m6 +=element['sumtotal'];}
        break;
        case'5':
          Timestamp d = element['date'];
          Month5 = g.toDate().toString().substring(0,7);
          sumtotal_m5 +=element['sumtotal'];
          break;
        case'4':{
          Timestamp d = element['date'];
          Month6 = g.toDate().toString().substring(0,7);
          sumtotal_m6 +=element['sumtotal'];}
        break;
        case'3':{
          Timestamp d = element['date'];
          Month6 = g.toDate().toString().substring(0,7);
          sumtotal_m6 +=element['sumtotal'];}
        break;
        case'2':{
          Timestamp d = element['date'];
          Month6 = g.toDate().toString().substring(0,7);
          sumtotal_m6 +=element['sumtotal'];}
        break;
        case'1':{
          Timestamp d = element['date'];
          Month6 = g.toDate().toString().substring(0,7);
          sumtotal_m6 +=element['sumtotal'];
        }
      };


});
  Report_income  m5 =Report_income(sumtatall: int.parse(sumtotal_m5.toString()),date: Month5);
  m1.add(m5);
  Report_income gg =Report_income(sumtatall: int.parse(sumtotal_m6.toString()),date: Month6);
  m1.add(gg);

  imcome.icome=m1;
  imcome.Refresh();
}