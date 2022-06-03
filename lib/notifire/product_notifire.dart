import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:untitled1/model/category.dart';
import 'package:untitled1/model/product_data.dart';

class categorynotifiere with ChangeNotifier {

    List<category_data> category = [];
    UnmodifiableListView<category_data> get categorylist => UnmodifiableListView(category);
}
