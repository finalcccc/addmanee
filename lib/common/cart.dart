// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/aip.dart';
import 'package:untitled1/celement/elements.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';

import '../notifire/categoryNotifire.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Cartnotifire cart = Provider.of<Cartnotifire>(context);
    SupplierNotifire supp =Provider.of<SupplierNotifire>(context);
    return Scaffold(
         body:Column(
           children: [
             Expanded(
               child: ListView.builder(
                 itemCount: cart.Cartlist.length,
                 itemBuilder: (context, index) {
                 return Card(
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Image.network('${cart.Cartlist[index].Product!.image}',width: 120,height: 120,fit:BoxFit.fill,),
                             Text('${cart.Cartlist[index].Product!.nameProduct}'),
                             Text('${cart.Cartlist[index].amout}'),
                             IconButton(onPressed: (){
                               cart.remove(index);
                             }, icon: Icon(Icons.delete),color: Colors.red,),
                             IconButton(onPressed: (){
                               cart.sum(index);
                             }, icon: Icon(Icons.add),color: element.main,),
                             IconButton(onPressed: (){
                               cart.dedet(index);
                             }, icon: Icon(Icons.minimize),color:element.main,),
                           ],
                         ),

                       ],
                     ));
               },),
             ),

             Container(
               height: 130,
               width: 400,
               decoration: BoxDecoration(
                 color: Colors.white30

               ),
               child: comboboxcontainer(context, supp),
             )


           ],
         ),

    ) ;}}

comboboxcontainer(context,SupplierNotifire supp) {
  return Expanded(
    child: Container(
        margin: const EdgeInsets.only(right:200, left: 5,bottom: 67,top: 10),
        decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            dropdownButton(supp),
          ],
        )),
  );
}

DropdownButton<String> dropdownButton(SupplierNotifire supp,) {
  int i = 0;
  return DropdownButton(
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 50,
      ),
      borderRadius: BorderRadius.circular(50),
      value: supp.SuppType,
      isExpanded: true,
      underline: Container(),
      hint: const Padding(
        padding: EdgeInsets.only(left: 50),
        child: Text("ເລືອກຜູ້ສະຫນອງ"),
      ),
      // icon: const Icon(Icons.keyboard_arrow_down),
      items: supp.Supliername
          .map((e) => DropdownMenuItem(
          value: e,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(e),
          )))
          .toList(),
      onChanged: (String? v) {
        supp.SelectType(v);
      });
}
