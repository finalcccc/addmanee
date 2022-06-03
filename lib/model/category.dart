class catagory_data{
  String? id;
  String? category;

  catagory_data();

  catagory_data.getcategory(Map<String, dynamic> value) {
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