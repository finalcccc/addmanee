
import 'package:flutter/material.dart';
import 'package:untitled1/api/Delete/Delete_category.dart';
import 'package:untitled1/api/Delete/Delete_emp.dart';
import 'package:untitled1/api/Delete/Delete_product.dart';
import '../api/Delete/Delete_supp.dart';

Dialog_D(context,{var notifire,required String? name,required String? typefuction}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              actions: [
                IconButton(
                  icon: const Icon(Icons.indeterminate_check_box_outlined,
                      color: Colors.red, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ທ່ານເເນ່ໃຈລະບໍ່ທີ່ຈະລົບຂໍ້ມູນ:',style: TextStyle(fontSize:20,color: Colors.grey),),

                      ],
                    ),
                    SizedBox(height: 10),
                    Text('  $name !',style: TextStyle(fontSize:20,color: Colors.red ,fontWeight: FontWeight.bold,)),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      height: 55,
                      child: ElevatedButton(
                        child: const Text(
                          'ລົບ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () async {
                          switch(typefuction){
                            case 'cate': Delete_Category(notifire);
                            break;
                            case 'products': Delete_products(notifire);
                            break;
                            case 'supplier': Delete_supp(notifire);
                            break;
                            case 'employee': Delete_emp(notifire);
                            break;
                          }


                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}