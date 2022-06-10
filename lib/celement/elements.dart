// ignore_for_file: non_constant_identifier_names, prefer_is_empty, camel_case_types, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/notifire/Cartnotififire.dart';

import '../api/aip.dart';

class element {
  static String? category;
  String? _name, _des;
  int? _price, _cost, _amount;

  static String nullimage = 'https://rae.mju.ac.th/images/untitled.png';
  //color
  static var main = const Color(0xff0031CA);
  static var Indigo = const Color(0xff281E5D);
  static var ocean = const Color(0xff016064);
  static var sky = const Color(0xff63c5da);
  static var wht = const Color(0xffFAFAFA);
  static var gray = const Color(0xffF7F7F7);

  //title
  static String title = "ຮ້ານເເອັດມານີ";
  static String p1 = "ສັ່ງສິນຄ້າເຂົ້າຮ້ານ";
  static String p2 = "ລົງທະບຽນ\nພະນັກງານ";
  static String p3 = "ຈັດການອໍເດິ";
  static String p4 = "ເພີ່ມສິນຄ້າ";
  static String p5 = "ຜູ້ສະໜອງ";
  static String p6 = "ປະເພດສິນຄ້າ";
  static String p7 = "ລາຍງານ";
  static String p8 = "ຮັບຊື້ສິນຄ້າເຂົ້າຮ້ານ";

  void elementgetcategory(String categorys) {
    category = categorys;
  }

// key khrong class form addproduct
  checks(GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      UploadProducts(
          nameProduct: _name,
          Description: _des,
          prices: _price,
          cost: _cost,
          amount: _amount,
          category: category);
      key.currentState!.reset();
    }
  }

  elevatedButton(GlobalKey<FormState> key, String? type) {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      width: 390,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: element.main,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16)),
        onPressed: () {
          switch (type) {
            case "addproduct":
              {
                checks(key);
              }
              break;
            case "addproduct_type":
              {
                checkformcategory(key);
              }
              break;
          }
        },
        child: const Text(
          "ບັນທືກ",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  // option
  static MenuButton(
      BuildContext context, String rout, var icons, Color colors, txt) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: colors, // Splash color
        onTap: () {
          Navigator.pushNamed(context, rout);
        },
        child: Container(
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons,
                  size: 90,
                  color: Colors.white,
                ),
                Text(txt,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

//BackPage
  static BackPage(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  RoutePageBack(BuildContext context, var page) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }

  //CartButton
  static CartButton(BuildContext context, route) {
      Cartnotifire amoutotal = Provider.of<Cartnotifire>(context);
    return Row(
      children: [
            Text('${amoutotal.Cartlist.length == 0?'':amoutotal.Cartlist.length}',style: TextStyle(color: Colors.white),),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }

  // textformfile
  inputFields(
      {context,
      String? trye,
      TextInputType? Keybordtye,
      String? hint,
      IconData? icons}) {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(icons),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: Keybordtye,
        validator: (v) {
          var tye = trye;
          if (v!.isEmpty) {
            return 'ກະລຸນາໃສ່ຂໍ້ມູນ';
          } else if (v.length < 1) {
            return 'ຂໍ້ມູນມັນສິ້ນເກີນໄປ';
          }
          switch (tye) {
            case "nameProduct":
              {
                _name = v;
              }
              break;
            case "cost":
              {
                _cost = int.parse(v);
              }
              break;

            case "price":
              {
                _price = int.parse(v);
              }
              break;

            case "description":
              {
                _des = v;
              }
              break;
            case "amount":
              {
                _amount = int.parse(v);
              }
              break;
            case "Products_type":
              {
                if (v.length < 3) return 'ຊື່ປະເພດສິ້ນຄ້າສັ້ນເກີນໄປ';
                cate(v);
              }
              break;
          }
          return null;
        },
      ),
    );
  }

  checkformcategory(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      AddProductType();
    }
  }

  void showdialog(BuildContext context, {String? title, String? content}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title!),
              content: Text(content!),
              actions: [
                TextButton(
                    onPressed: () {
                      //Navigator.of(context).pop;
                    },
                    child: const Text(""))
              ],
            ));
  }

  TabbarPage(
      {String? label1,
      String? label2,
      IconData? icos1,
      IconData? icos2,
      required var tap1,
      required var tap2}) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: element.main,
          activeColor: Colors.white,
          inactiveColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
              label: label1,
              icon: Icon(icos1),
            ),
            BottomNavigationBarItem(
              label: label2,
              icon: Icon(icos2),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return tap1;
            case 1:
            default:
              return tap2;
          }
        });
  }
}
