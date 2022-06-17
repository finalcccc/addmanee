import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/Report_Income_Modle.dart';

class report_incomeNotifire with ChangeNotifier{
  List<Report_income>icome = [];
  List<Report_income>icome_day = [];
  Report_income? curren_income;

  Refresh(){
    icome_day;
    curren_income;
    icome;
    notifyListeners();
  }

}