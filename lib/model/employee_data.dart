class EmployeeData {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
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
    this.confirmPassword,
    this.position,
    this.tel,
  });

  Map<String, dynamic>? toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      "confirmPassword": confirmPassword,
      'date': date,
      'address': address,
      'tel': tel,
      'position': position,
    };
  }
}
