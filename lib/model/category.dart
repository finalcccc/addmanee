class Product_type_data{
  String? id;
  String? category;

  Product_type_data();

  Product_type_data.getProdcttype(Map<String, dynamic> value) {
    id = value['id'];
    category= value['category'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nametye': category,
    };
  }
}