// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/categoryNotifire.dart';
import 'package:untitled1/screen/detialOfdata/categoryDetail.dart';

import '../../api/getCategoryData.dart';

class ViewCategory extends StatefulWidget {
  const ViewCategory({Key? key}) : super(key: key);

  @override
  State<ViewCategory> createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future dos() async {

    CategoryNotifire category = Provider.of<CategoryNotifire>(context, listen: false);
    await GetCategoryData(category);
    category.RefreshCategory();

  }

  @override
  Widget build(BuildContext context) {
    CategoryNotifire category = Provider.of<CategoryNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍລະອຽດຂອງປະເພດສິນຄ້າ'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: dos,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return CardCategory(index, category);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
              );
            },
            itemCount: category.categoryList.length),
      ),
    );
  }

  Widget CardCategory(int index, CategoryNotifire category) {
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.category),
            title: Text("${category.categoryList[index].category}",
                style: const TextStyle(color: Colors.green)),
            subtitle: Text(
              "${category.categoryList[index].id}",
              style: const TextStyle(color: Colors.orangeAccent),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('ແກ້ໄຂ'),
                onPressed: () {
                  Text(
                    "${category.categoryList[index].category}",
                    style: const TextStyle(color: Colors.green),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryDetail(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('ລົບ'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
