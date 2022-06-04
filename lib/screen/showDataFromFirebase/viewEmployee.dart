import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/getEmployeeData.dart';
import 'package:untitled1/notifire/employeeNotifire.dart';

import '../detialOfdata/employeeDetail.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({Key? key}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}


class _ViewEmployeeState extends State<ViewEmployee> {

  void initState() {
    super.initState();
    dos();
  }

  Future dos() async {
    EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context, listen: false);
    await GetEmployeeData(emp);
  }
  final List<String> items =
  List<String>.generate(20, (index) => "items: {++index}");
  @override
  Widget build(BuildContext context) {
    EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນລາຍລະອຽດຂອງພະນັກງານ'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: emp.employeeList.length,
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
                  child: Text('${emp.employeeList[index].name}')),

              subtitle:  Text('${emp.employeeList[index].position}'),
              trailing: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
