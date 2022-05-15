import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';

class veiwproduct extends StatefulWidget {
  const veiwproduct({Key? key}) : super(key: key);

  @override
  State<veiwproduct> createState() => _veiwproductState();
}

class _veiwproductState extends State<veiwproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: element.backpage(context),
        ),
        body: buildCenter());
  }
}

Widget buildCenter() {
  return Center(
    child: Stack(
      children: [
        Container(
          width: 150,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: element.gray,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                ),
              ]),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("dd"),
        )
      ],
    ),
  );
}
