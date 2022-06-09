class import_products {
  String? id_purchase;
  String? id_products;
  num? amout ;
  num? cost;
  num? amouttotal;
  import_products({this.amout,this.id_products,this.id_purchase,this.cost,this.amouttotal});

  Map<String, dynamic> toMap() {
    return {
      ' id_purchase': id_purchase,
      'id_products': id_products,
      'cost': cost,
      'amout': amout,
      'amouttotal': amouttotal,
    };
  }
}
