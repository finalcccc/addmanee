import 'package:flutter/material.dart';
import 'package:untitled1/celement/elements.dart';

class win_dorders extends StatefulWidget {
  const win_dorders({Key? key}) : super(key: key);

  @override
  State<win_dorders> createState() => _win_dordersState();
}

class _win_dordersState extends State<win_dorders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: element.main,
          leading: element.backpage(context),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 40),
                  _inputFields(context)
                ],
              ),
            ),
          ],
        ),
    );
  }
}
_inputFields(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: "ຊື່",
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          hintText: "Email",
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          hintText: "ລະຫັດຜ່ານ",
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.password_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          hintText: "ຍືນຍັນລະຫັດຜ່ານ",
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.password_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          hintText: "ວັນ ເດືອນ ປີ ເກີດ",
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          hintText: "ທີ່ຢູ່",
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.home_filled),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 20),
      ElevatedButton(

        onPressed: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const login()),
          //  );
        },
        child: const Text(
          "ບັນທືກ",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            primary: element.main,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16)),
      ),
    ],
  );
}
