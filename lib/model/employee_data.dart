import 'package:untitled1/notifire/categoryNotifire.dart';

class EmployeeData {
  String? name;
  String? email;
  String? password;
  // String? confirmPassword;
  String? tel;
  String? date;
  String? address;
  String? position;
  EmployeeData({
    this.email,
    this.password,
    this.name,
    this.date,
    this.address,
    // this.confirmPassword,
    this.position,
    this.tel,
  });
  static List<String> positoin = ['Admin', 'Sale'];
  EmployeeData.frommap(Map<String, dynamic> value) {
    name = value['name'];
    email = value['email'];
    password = value['password'];
    date = value['date'];
    address = value['address'];
    tel = value['tel'];
    position = value['position'];
  }

  Map<String, dynamic>? toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'date': date,
      'address': address,
      'tel': tel,
      'position': position,
    };
  }
}
