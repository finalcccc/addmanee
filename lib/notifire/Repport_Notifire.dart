import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/Report_Income_Modle.dart';

class report_incomeNotifire with ChangeNotifier{
  List<Report_income>icome = [];
  List<Report_income>icome_day = [];
  Report_income? curren_income;

  List<Report_income>expanese = [];
  List<Report_income>expanese_day = [];
  Report_income? curren_expanese;

  Refresh(){
    expanese;
    expanese_day;
    curren_expanese;
    icome_day;
    curren_income;
    icome;
    notifyListeners();
  }

}