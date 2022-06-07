// ignore_for_file: unused_local_variable, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/categoryNotifire.dart';
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
    CategoryNotifire category = Provider.of<CategoryNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍລະອຽດຂອງປະເພດສິນຄ້າ'),
        centerTitle: true,
        leading: element().RoutePageBack(context, const ViewCategory()),
        backgroundColor: element.main,
      ),
      body: Card(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ລະຫັດ: ' + ' ${category.CurrentCategory!.id}'),
            Text('ຊື່ປະເພດສິນຄ້າ :' + ' ${category.CurrentCategory!.category}'),
            const SizedBox(height: 550),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
