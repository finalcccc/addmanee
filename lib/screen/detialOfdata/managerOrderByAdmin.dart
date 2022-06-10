// ignore_for_file: use_build_context_synchronously, camel_case_types, non_constant_identifier_names, prefer_is_empty, await_only_futures

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/api/UploadData/upload_importproduct.dart';
import 'package:untitled1/model/importproducts_Model.dart';
import 'package:untitled1/notifire/import_product.dart';
import 'package:untitled1/notifire/purchase_order_Notifire.dart';
import 'package:untitled1/notifire/supplierNotifire.dart';
import 'package:untitled1/screen/manageOrder.dart';
import 'package:untitled1/celement/elements.dart';

import '../../api/UploadData/Upload_Data_phuasOrder.dart';
import '../../api/getsupplier.dart';

class ManagerOrderByAdmin extends StatefulWidget {
  const ManagerOrderByAdmin({Key? key}) : super(key: key);

  @override
  State<ManagerOrderByAdmin> createState() => _ManagerOrderByAdminState();
}

class _ManagerOrderByAdminState extends State<ManagerOrderByAdmin> {
  @override
  void initState() {
    super.initState();
    dos();
  }

  Future dos() async {
    SupplierNotifire supp =
        Provider.of<SupplierNotifire>(context, listen: false);
    await GetSupplier(supp);
  }

  @override
  Widget build(BuildContext context) {
    purchase_order_Notifire orderadmin =
        Provider.of<purchase_order_Notifire>(context);
    SupplierNotifire supp = Provider.of<SupplierNotifire>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ຊື້ສິນຄ້າຈາກຜູ້ສະໜອງ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ManageOrder()),
        ),
        body: ListView.builder(
          itemCount: supp.SuplierList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      supp.CurrentSupplier = supp.SuplierList[index];
                      await GetPureChaseNoly(
                          order_admin: orderadmin, supp: supp);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Show_order_addmin()));
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ຊື່ຜູ້ສະໜອງ: ' ' ${supp.SuplierList[index].name}',
                            style: const TextStyle(fontSize: 15),
                          )
                        ]),
                  )),
            );
          },
        ));
  }
}

///////////========////////////////========////////////////========////////////

class Show_order_addmin extends StatefulWidget {
  const Show_order_addmin({Key? key}) : super(key: key);

  @override
  State<Show_order_addmin> createState() => _Show_order_addminState();
}

class _Show_order_addminState extends State<Show_order_addmin> {
  @override
  Widget build(BuildContext context) {
    purchase_order_Notifire orderadmin =
        Provider.of<purchase_order_Notifire>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ຂໍ້ມູນລາຍລະອຽດຂອງຜູ້ສະໜອງ'),
          centerTitle: true,
          backgroundColor: element.main,
          leading: element().RoutePageBack(context, const ManageOrder()),
        ),
        body: ListView.builder(
          itemCount: orderadmin.Order_addminlist.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      orderadmin.Currenorderaddmin = await orderadmin.Order_addminlist[index];
                      await orderadmin.Curren();
                      await GetDetill(order_admin: orderadmin);
                      orderadmin.Refresh();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Detellorder_addmid()));
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ຊື່ຜູ້ສະໜອງ: '
                              ' ${orderadmin.Order_addminlist[index].NameSupplier}'),
                          Text('ຈຳນວນທັງໝົດ: '
                              ' ${orderadmin.Order_addminlist[index].amouttotal} ແກັດ'),
                          Text('ວັນ ທີ ເດືອນ ປີ:'
                              ' ${orderadmin.Order_addminlist[index].date!.toDate()}'),
                        ]),
                  )),
            );
          },
        ));
  }
}

///////////  ============= ///////////=======///////////

class Detellorder_addmid extends StatefulWidget {
  const Detellorder_addmid({Key? key}) : super(key: key);

  @override
  State<Detellorder_addmid> createState() => _Detellorder_addmidState();
}

class _Detellorder_addmidState extends State<Detellorder_addmid> {

  @override
  Widget build(BuildContext context) {
    purchase_order_Notifire orderadmin =
        Provider.of<purchase_order_Notifire>(context);
    SupplierNotifire supp = Provider.of<SupplierNotifire>(context);
   importproductNotifire impit_product = Provider.of<importproductNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນລາຍລະອຽດຂອງການສັ່ງຊື້'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const Show_order_addmin()),
      ),
      body: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ຊື່ຜູ້ສະໜອງ:  ${supp.CurrentSupplier!.name}'),
                  Text('ທີ່ຢູ່: ${supp.CurrentSupplier!.address}'),
                  Text('ເບີໂທ: ${supp.CurrentSupplier!.tel}'),
                  Text('ອີເມວ: ${supp.CurrentSupplier!.email}'),
                  Text(
                      'ວັນທີສັ່ງຊື້: ${orderadmin.Currenorderaddmin!.date!.toDate()}'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderadmin.Dettil.length,
                itemBuilder: (context, index) {
                  return orderadmin.Productditill.length != 0
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                    '${orderadmin.Productditill[index].image}',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                          'ຊື່ສິນຄ້າ: ${orderadmin.Productditill[index].nameProduct}'),
                                      Text(
                                          'ປະເພດສິນຄ້າ: ${orderadmin.Productditill[index].category}'),
                                      Text(
                                          'ຈຳນວນ: ${orderadmin.Dettil[index].amout} ແກັດ'),
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                        orderadmin.Productaddmin = orderadmin.Productditill[index];
                                      _Dialog(orderadmin,context,impit_product);
                                    },
                                    child: const Text('ເພີ່ມ')),
                              ],
                            )
                          ],
                        )
                      : Container();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      'ຈຳນວນທັງໝົດ: ${orderadmin.Currenorderaddmin!.amouttotal} ແກັດ'),
                  ElevatedButton(
                    child: const Text('ບັນທຶກເປັນພີດີເອຟ'),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  //////////=======////////=======/////////=======///////
  final GlobalKey<FormState> _key_import = GlobalKey<FormState>();
  int? amouts,costs,amoutall;

  _Dialog(purchase_order_Notifire orderaddmin,context,importproductNotifire improtduct) {
    return showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(

          actions: [
        IconButton(
        icon: const Icon(Icons.indeterminate_check_box_outlined,color: Colors.red,size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
            Column(
              children: [
                Form(
                    key: _key_import,
                    child: Container(
                      width:400,
                      height:530,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10,left: 25),
                          child: Text(
                            'ເພີ່ມສິນຄ້າຜູ້ສະໜອງ',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'ຊື່ສິນຄ້າ :  ${orderaddmin.Productaddmin!.nameProduct}'
                        ),
                        SizedBox(height: 30),
                        ////////////////////////////////////////////////
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "ລາຄາທືນ",
                            fillColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            filled: true,
                            prefixIcon:
                                const Icon(Icons.price_check),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (cost) {
                            setState((){
                              costs=int.parse(cost!);
                            });

                          },
                          validator: (cost) {
                            if (cost!.isEmpty) {
                              return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                            } else if (cost.length < 4) {
                              return "ກວດສວບລາຄາ";
                            }
                            return null;
                          },
                          onTap: (){
                            setState((){
                              amoutall = costs!*amouts!;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        /////////////////////////////////////////
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "ຈຳນວນ",
                            fillColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            filled: true,
                            prefixIcon:
                                const Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (amout) {
                            setState((){
                              amouts = int.parse(amout!);
                            });

                            },
                          validator: (amout) {
                            if (amout!.isEmpty) {
                              return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                            } else if (amout.length < 1) {
                              return "ເບີໂທລະສັບບໍ່ຖືກຕ້ອງ";
                            }
                            return null;
                          },
                        ),
                        // const SizedBox(height: 10),
                        // Text('ລາຄາລວມ : ${amoutall}ຂອງສິນຄ້າ'),
                        const SizedBox(height: 40),

                        Container(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            child: Text('ບັນທືກ'),
                            onPressed: ()async{
                              if(_key_import.currentState!.validate()){
                                 _key_import.currentState!.save();
                                if(costs != null && amouts != null && orderaddmin.Currenorderaddmin != null){
                                  improtduct.impt_product = await import_products(cost: costs,amout:amouts,amouttotal: costs!*amouts!,id_products: orderaddmin.Productaddmin!.id,id_purchase: orderaddmin.Currenorderaddmin!.id );
                                  improtduct.Refresh();
                                  Upload_import_product(improtduct);
                                }else{
                                  print('no');
                                }

                              }

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
