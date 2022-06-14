

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class view_order extends StatefulWidget {
  const view_order({Key? key}) : super(key: key);

  @override
  State<view_order> createState() => _View_orderState();
}

class _View_orderState extends State<view_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return Card(
                child: Column(
                 children: [
                   Text('sssss'),
                 ],
                ),
              );},itemCount: 100,),
          )
        ],
      ),
    );
  }
}
