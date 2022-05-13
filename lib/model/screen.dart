import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/login_and_singup/login.dart';
import 'dart:async';
import 'package:untitled1/model/menou.dart';

class splatscreen extends StatefulWidget {
  const splatscreen({Key? key}) : super(key: key);

  @override
  State<splatscreen> createState() => splatscreenState();
}

class splatscreenState extends State<splatscreen> {
  @override
  void initState() {
  Timer(Duration(seconds:3),()=> Navigator.push(context, CupertinoPageRoute(builder: (_) => login(),)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: const [
                 Text('ຮ້ານເເອັດມານີ້',style: TextStyle(
                      color: Colors.white,fontSize: 44,fontWeight: FontWeight.bold
                 ),),
                 SizedBox(height: 20,)
                 ,
                 CircularProgressIndicator(color: Colors.white,)
               ],
             )
           ),
        ),
    );
  }
}
