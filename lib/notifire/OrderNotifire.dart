import 'package:flutter/foundation.dart';

import '../model/Orde_Modelr.dart';

class Order_Notifire with ChangeNotifier{
List<Order_Model_upload> Order =[];

 Referenc(){
   Order;
   notifyListeners();
 }

}