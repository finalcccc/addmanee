// ignore_for_file: use_build_context_synchronously

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
    EmployeeNotifire category =
        Provider.of<EmployeeNotifire>(context, listen: false);
    await GetCategoryData(category);
    Provider.of<EmployeeNotifire>(context, listen: false).RefreshCategory();
  }

  @override
  Widget build(BuildContext context) {
    EmployeeNotifire category = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewCategory'),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: dos,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${category.categoryList[index].category}'),
              );
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
}
