import 'package:flutter/material.dart';

class element {
  //color
  static var main = const Color(0xff0031CA);
  static var Indigo = const Color(0xff281E5D);
  static var ocean = const Color(0xff016064);
  static var sky = const Color(0xff63c5da);
  static var wht = const Color(0xffFAFAFA);
  static var gray = const Color(0xffF7F7F7);

  //tiltal
  static String titall = "ຮ້ານເເອັດມານີ";
  static String p1 = "ຮັບອໍເດິ";
  static String p2 = "ລົງທະບຽນພະນັກງານ";
  static String p3 = "ຈັດການອໍເດິ";
  static String p4 = "ເພີ່ມສິນຄ້າ";
  static String p5 = "ຜູ້ສະໜອງ";

  // option
  static butn(BuildContext context, String rout, var icons, Color colors, txt) {
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

//bage page
  static backpage(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  //rout ກະຕ້າເຄື່ອງ
  static cartbuton(BuildContext context, rout) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, rout);
        },
        icon: Icon(Icons.shopping_cart_outlined));
  }
}
