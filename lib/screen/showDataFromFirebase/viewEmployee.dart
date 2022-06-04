import 'package:flutter/material.dart';

import '../detialOfdata/employeeDetail.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({Key? key}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  final List<String> items =
  List<String>.generate(20, (index) => "items: {++index}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Product'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return  Card(
            child: ListTile(
              leading: const Icon(Icons.people),
              title: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmployeeDetail(),
                      ),
                    );
                  },
                  child: const Text('name of product')),
              subtitle: const Text('id'),
              trailing: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
