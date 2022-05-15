import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/model/menu.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //_logo(),
            SizedBox(
              height: 20,
            ),
            _inputField(
                Icon(Icons.person_outline, size: 30, color: Color(0xffA6B0BD)),
                "Username",
                false),
            _inputField(
                Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)),
                "Password",
                true),
            _loginBtn(context),
            _signUp(),
          ],
        ),
      ),
    );
  }
}

Widget _logo() {
  return Container(
    margin: EdgeInsets.only(top: 100),
    child: Stack(
      children: [
        Positioned(
            left: -50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff00bfdb),
              ),
            )),
        Positioned(
            child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff008FFF),
          ),
        )),
        Positioned(
            left: 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff00227E),
              ),
            ))
      ],
    ),
  );
}

Widget _inputField(Icon prefixIcon, String hintText, bool isPassword) {
  return Container(
    // width: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 25,
          offset: Offset(0, 5),
          spreadRadius: -25,
        ),
      ],
    ),
    margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
    child: TextField(
      obscureText: isPassword,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xff000912),
        ),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 25),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xffA6B0BD),
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: 75,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget _loginBtn(BuildContext context) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 20, bottom: 50),
    decoration: BoxDecoration(
        color: Color(0xff008FFF),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Color(0x60008FFF),
            blurRadius: 10,
            offset: Offset(0, 5),
            spreadRadius: 0,
          ),
        ]),
    child: FlatButton(
      onPressed: () =>
          {Navigator.push(context, CupertinoPageRoute(builder: (_) => Menu()))},
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Text(
        "SIGN IN",
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
    ),
  );
}

Widget _signUp() {
  return FlatButton(
    onPressed: () => {print("Sign up pressed.")},
    child: Text(
      "SIGN UP NOW",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF008FFF),
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
    ),
  );
}
