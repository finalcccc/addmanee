class category_data {
  String? id;
  String? category;
category_data();
 category_data.frommap(Map<String, dynamic> value) {

        id =value['id'];
        category =value['category'];

  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
    };
  }
}