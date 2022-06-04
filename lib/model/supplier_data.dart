class SupplierData {
  String? id;
  String? name;
  String? email;
  String? tel;
  String? address;
  String? supplyProduct;
  SupplierData();
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'tel': tel,
      'address': address,
      'supplyProduct': supplyProduct
    };
  }
}