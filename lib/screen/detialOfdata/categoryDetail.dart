import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewCategory.dart';

import '../../celement/elements.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍລະອຽດຂອງປະເພດສິນຄ້າ'),
        centerTitle: true,
        leading: element().RoutePageBack(context, const ViewCategory()),
        backgroundColor: element.main,
      ),
    );
  }
}
