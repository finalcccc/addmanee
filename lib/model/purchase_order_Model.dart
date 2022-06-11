
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/model/product_Model.dart';

class CartDetailData {
  product_Model? Product;
  int amout = 0;

  CartDetailData(this.Product, this.amout);
}

class CartModel {
  String? Product_ID;
  int? amout;
  CartModel(this.Product_ID,this.amout);
  CartModel.formMAp(Map<String, dynamic> v) {
    Product_ID = v['nameProduct'];
    amout = v['amout'];
  }
  Map<String,dynamic>toMap(){
    return{
      'nameProduct':Product_ID,
      'amout':amout
    };
  }
}
class CartModelupload{
  String?id;
    String? Supplier_ID;
    int? amouttotal;
    CartModel? Detell;
    var Ditell =[];
    Timestamp?date;
 CartModelupload();
 List<int> p =[1,2,3];
  CartModelupload.formMap(Map<String,dynamic>v){
    id=v['id'];
    Supplier_ID = v['Supplier_ID'];
    amouttotal =v['amouttotal'];
    Ditell = v['Ditell'];
    date=v['date'];
  }
  Map<String, dynamic> toMap() =>{
      'id':id,
      'NameSupplier':Supplier_ID,
      'amouttotal':amouttotal,
      'Ditell':Ditell,
       'date':DateTime.now()

  };

}