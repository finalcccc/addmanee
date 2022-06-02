import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  void initState() {
    //product_notifire Productnotifier = Provider.of<product_notifire>(context, listen: true);
    // getproduct();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // product_notifire Productnotifier = Provider.of<product_notifire>(context);
    return Scaffold(
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return const Text('hj');
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.black,
                );
              },
              itemCount: 12)),
    );
  }
}
