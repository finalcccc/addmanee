import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    SupplierNotifire supp = Provider.of<SupplierNotifire>(context,listen: false);
    await GetSupplier(supp);
  }
  @override
  Widget build(BuildContext context) {
      purchase_order_Notifire orderadmin = Provider.of<purchase_order_Notifire>(context);
      SupplierNotifire supp = Provider.of<SupplierNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຊື້ສິນຄ້າຈາກຜູ້ສະໜອງ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const ManageOrder()),
      ),
      body:ListView.builder(itemCount:supp.SuplierList.length ,itemBuilder:(context, index) {
        return Card(
          
          child:Padding(padding: EdgeInsets.all(10),child:
          InkWell(
            onTap: ()async{
              supp.CurrentSupplier = supp.SuplierList[index];
            await  GetPureChaseNoly(order_admin: orderadmin,supp: supp);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Show_order_addmin()));
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Text('${supp.SuplierList[index].name}')

              
            ]),
          )) ,
        );
        
      },)
    );
  }
}





/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Show_order_addmin extends StatefulWidget {
  const Show_order_addmin({Key? key}) : super(key: key);

  @override
  State<Show_order_addmin> createState() => _Show_order_addminState();
}

class _Show_order_addminState extends State<Show_order_addmin> {
  @override
  Widget build(BuildContext context) {
    purchase_order_Notifire orderadmin = Provider.of<purchase_order_Notifire>(context);
    return Scaffold(
        body:ListView.builder(itemCount:orderadmin.Order_addminlist.length ,itemBuilder:(context, index) {
          return Card(

            child:Padding(padding: EdgeInsets.all(10),child:
            InkWell(
              onTap: ()async{
                orderadmin.Currenorderaddmin = await orderadmin.Order_addminlist[index];
                await orderadmin.Curren();
                await GetDetill(order_admin: orderadmin);
                orderadmin.Refresh();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Detellorder_addmid()));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${orderadmin.Order_addminlist[index].NameSupplier}'),
                    Text('${orderadmin.Order_addminlist[index].amouttotal}'),
                    Text('${orderadmin.Order_addminlist[index].date!.toDate()}'),
                  ]),
            )) ,
          );

        },)
    );
  }
}

class Detellorder_addmid extends StatefulWidget {
  const Detellorder_addmid({Key? key}) : super(key: key);

  @override
  State<Detellorder_addmid> createState() => _Detellorder_addmidState();
}

class _Detellorder_addmidState extends State<Detellorder_addmid> {
  @override
  Widget build(BuildContext context) {
    purchase_order_Notifire orderadmin = Provider.of<purchase_order_Notifire>(context);
    SupplierNotifire supp = Provider.of<SupplierNotifire>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${supp.CurrentSupplier!.name}'),
          Text('${supp.CurrentSupplier!.address}'),
          Text('${supp.CurrentSupplier!.tel}'),
          Text('${supp.CurrentSupplier!.email}'),
          Expanded(
            child: ListView.builder(itemCount: orderadmin.Dettil.length,
              itemBuilder: (context, index) {
                return orderadmin.Productditill.length != 0 ? Column(children: [
                  Row(
                    children: [
                      Image.network('${orderadmin.Productditill[index].image}',width: 100,height: 100,fit: BoxFit.fill),
                      Text('${orderadmin.Productditill[index].nameProduct}'),
                      Text('${orderadmin.Dettil[index].amout}'),
                      Text('${orderadmin.Productditill[index].category}'),
                      TextButton(
                          onPressed: () {
                          },
                          child: const Text('ເພີ່ມ')),
                    ],
                  )
                ],):Container();
              },),
          ),
          Text('${orderadmin.Currenorderaddmin!.amouttotal}'),
          Text('${orderadmin.Currenorderaddmin!.date!.toDate()}')
        ],
      ),
    );
  }

  Dailog(purchase_order_Notifire Carts, context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(right: 15, left: 15),
                  width: 390,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: element.main,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    onPressed: () {

                    },//r
                    child: const Text(
                      "ເພີ່ມສິນເຂົ້າກະຕ້າ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            )
          ],
        ));
  }

}

