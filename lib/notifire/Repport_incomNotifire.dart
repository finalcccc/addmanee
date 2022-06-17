import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/Report_Income_Modle.dart';

class report_incomeNotifire with ChangeNotifier{
  List<Report_income>icome = [];

  Refresh(){
    icome;
    notifyListeners();
  }

}