import 'package:untitled1/celement/elements.dart';
import 'package:flutter/material.dart';
class m_order extends StatefulWidget {
  const m_order({Key? key}) : super(key: key);

  @override
  State<m_order> createState() => _m_orderState();
}

class _m_orderState extends State<m_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: element.backpage(context)
      ),
    );
  }
}
