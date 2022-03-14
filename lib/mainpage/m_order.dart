import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:flutter/material.dart';
class m_order extends StatefulWidget {
  const m_order({Key? key}) : super(key: key);

  @override
  State<m_order> createState() => _m_orderState();
}

class _m_orderState extends State<m_order> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
      builder: (context,snapshot){
        if (snapshot.hasError) {
        return Scaffold(
        appBar: AppBar(title: Text("eror"),),
        body: Center(child: Text("${snapshot.error}"),),
      );
    }
        if(snapshot.connectionState == ConnectionState.done){
         return Scaffold(
           body: Center(
             child: Text('${snapshot.connectionState}'),
           ),
         );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator(),),
        );
  }
    );
  }
}
