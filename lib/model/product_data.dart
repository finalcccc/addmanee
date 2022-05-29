class Product_data {
  String? id;
  String?nameProduct;
  String? image;
  String? desciption;
  int?price, cost, amount;
  String?category;

  Map<String, dynamic> toMap() {
    return {
    'id':id,
    'nameProduct':nameProduct,
    'image':image,
    'desciption':desciption,
    'price':price,
    'amount':amount,
    'cost':cost,
    'category':category
    };

  }
}