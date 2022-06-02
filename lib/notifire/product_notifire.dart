import 'package:flutter/foundation.dart';

class notifiere with ChangeNotifier {

  String? category;

  categorys(String? category){
    category = category;
    notifyListeners();
  }

}
