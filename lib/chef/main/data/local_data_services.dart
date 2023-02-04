import 'package:chef_ruler/chef/main/model/product_model.dart';
import 'package:chef_ruler/chef/main/model/select_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocalDataServices {
  final firestore = FirebaseFirestore.instance.collection('product');

  Future<List<MainPageModel>> getMainProduct() async {
    var data = await firestore.get();
    var products = data.docs
        .map((product) => MainPageModel.fromFireStore(product.data()))
        .toList();

    return products;
  }

  Future<List<SelectProductModel>> getSelectProduct(
      String categoryGender) async {
    final firestore = FirebaseFirestore.instance.collection('select_product');
    var data = await firestore.where('gender', isEqualTo: categoryGender).get();

    var products = data.docs
        .map((selectProduct) =>
            SelectProductModel.fromFireStore(selectProduct.data()))
        .toList();

    return products;
  }
}
