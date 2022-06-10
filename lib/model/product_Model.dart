class product_Model {
  String? id;
  String? nameProduct;
  String? image;
  String? description;
  int? price, cost, amount;
  String? category;

  product_Model();

  product_Model.formMap(Map<String, dynamic> value) {
    id = value['id'];
    nameProduct = value['nameProduct'];
    image = value['image'];
    description = value['description'];
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
      'description': description,
      'price': price,
      'amount': amount,
      'cost': cost,
      'category': category,
      'date':DateTime.now()
    };
  }
}
