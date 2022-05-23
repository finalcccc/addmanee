class EmployeeData {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String tel;
  final String date;
  final String address;
  final String position;
  EmployeeData({
    required this.email,
    required this.password,
    required this.name,
    required this.date,
    required this.address,
    required this.confirmPassword,
    required this.position,
    required this.tel,
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
