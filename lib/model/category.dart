class catagory_data {
  String? id;
  String? category;

  catagory_data({this.id, this.category});

  factory catagory_data.frommap(Map<String, dynamic> value) {
    return catagory_data(
        id : value['id'],
        category : value['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
    };
  }
}