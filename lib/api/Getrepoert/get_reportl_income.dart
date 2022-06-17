



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/Report_Income_Modle.dart';
import 'package:untitled1/notifire/Repport_incomNotifire.dart';

Get_reportl_income(report_incomeNotifire imcome)async{
  List<Report_income> m1 =[];
  List<num> sumtotal=[0,0,0,0,0,0,0,0,0,0,0,0];
  List<String> Month=['','','','','','','','','','','',''];
  int subvalue =10;
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
          Month[11] = g.toDate().toString().substring(0,subvalue);
          sumtotal[11]+=element['sumtotal'];
          break;
        case'11':
          Month[10]= g.toDate().toString().substring(0,subvalue);
          sumtotal[10]+=element['sumtotal'];
          break;
        case'10':
          Month[9] = g.toDate().toString().substring(0,subvalue);
          sumtotal[9]+=element['sumtotal'];
          break;
        case'9':
          Month[8]= g.toDate().toString().substring(0,subvalue);
          sumtotal[8]+=element['sumtotal'];
          break;
        case'8':
          Month[7] = g.toDate().toString().substring(0,subvalue);
          sumtotal[7]+=element['sumtotal'];
          break;
        case'7':
          Month[6] = g.toDate().toString().substring(0,subvalue);
          sumtotal[6]+=element['sumtotal'];
          break;
        case'6':{
          Month[5] = g.toDate().toString().substring(0,subvalue);
          sumtotal[5]+=element['sumtotal'];}
        break;
        case'5':
          Month[4] = g.toDate().toString().substring(0,subvalue);
          sumtotal[4]+=element['sumtotal'];
          break;
        case'4':{
          Month[3] = g.toDate().toString().substring(0,subvalue);
          sumtotal[3]+=element['sumtotal'];}
        break;
        case'3':{
          Month[2]=g.toDate().toString().substring(0,subvalue);
          sumtotal[2]+=element['sumtotal'];}
        break;
        case'2':{
          Month[1] = g.toDate().toString().substring(0,subvalue);
          sumtotal[1]+=element['sumtotal'];}
        break;
        case'1':{
          Month[0] = g.toDate().toString().substring(0,subvalue);
          sumtotal[0]+=element['sumtotal'];
        }
      };
});
  int i = 0 ;
  for(var shan in Month){
    if(Month[i] != ''){
      Report_income  m5 =Report_income(sumtatall: int.parse(sumtotal[i].toString()),date: Month[i]);
      m1.add(m5);
      imcome.icome=m1;
      imcome.Refresh();
    }
    i++;
  }



}