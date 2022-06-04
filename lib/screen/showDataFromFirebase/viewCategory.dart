// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/categoryNotifire.dart';

import '../../api/getCategoryData.dart';

class ViewCategory extends StatefulWidget {
  const ViewCategory({Key? key}) : super(key: key);

  @override
  State<ViewCategory> createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future dos() async {
    CategoryNotifire category =
        Provider.of<CategoryNotifire>(context, listen: false);
    await GetCategoryData(category);
    Provider.of<CategoryNotifire>(context, listen: false).RefreshCategory();
  }

  @override
  Widget build(BuildContext context) {
    CategoryNotifire category = Provider.of<CategoryNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewCategory'),
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
    return  Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.call),
            title: Text("${category.categoryList[index].category}",
                style: TextStyle(color: Colors.green)),
            subtitle: Text(
              "${category.categoryList[index].id}",
              style: TextStyle(color: Colors.orangeAccent),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Dail'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Call History'),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
