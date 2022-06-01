class Product_data {
  String? id;
  String? nameProduct;
  String? image;
  String? desciption;
  int? price, cost, amount;
  String? category;

  Product_data();

  Product_data.getProdct(Map<String, dynamic> value) {
    id = value['id'];
    nameProduct = value['nameProduct'];
    image = value['image'];
    desciption = value['desciption'];
    price = value['price'];
    cost = value['cost'];
    amount = value['amount'];
    category = value['category'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameProduct': nameProduct,
      'image': image,
      'desciption': desciption,
      'price': price,
      'amount': amount,
      'cost': cost,
      'category': category
    };
  }
}
