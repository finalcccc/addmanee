// ignore_for_file: unused_local_variable, prefer_adjacent_string_concatenation, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/categoryNotifire.dart';
import 'package:untitled1/screen/showDataFromFirebase/viewCategory.dart';

import '../../celement/elements.dart';
import '../../dialog/dialog_category.dart';

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
        body: Center(
            child: Container(
          height: 270,
          margin: const EdgeInsets.all(10),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'ລະຫັດ:',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '  ${category.CurrentCategory!.id}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      'ຊື່ປະເພດສິນຄ້າ :' +
                          ' ${category.CurrentCategory!.category}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  CategoryDialog().Dialog(context, category);
                                },
                                child: const Text(
                                  'ແກ້ໄຂ',
                                  style: TextStyle(fontSize: 16),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        )));
  }
}
