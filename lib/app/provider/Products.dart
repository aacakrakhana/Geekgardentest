import 'package:flutter/material.dart';
import 'package:geekgarden/app/model/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _allProduct = [];

  List<Product> get allProduct => _allProduct;
 Uri uri =
        Uri.parse("https://geekgarden-fe8e2-default-rtdb.firebaseio.com/");
    
  int get jumlahProduct => _allProduct.length;

  Product selectByID(String id) =>
      _allProduct.firstWhere((element) => element.id == id);

  void addProduct(
      String id,
      String title,
      String description,
      String category,
      String image,
      String price,
      String rating,
      BuildContext context)  {
   
    
      

    allProduct.add(
      Product(
        id: id.toString(),
        category: category,
        description: description,
        title: title,
        image: image,
        price: price,
        rating: rating,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil ditambah'),
        duration: Duration(seconds: 1),
      ),
    );
    notifyListeners();
  }

  void editProduct(String id, String title, String description, String category,
      String image, String price, String rating, BuildContext context) {
    Product selectProduct =
        _allProduct.firstWhere((element) => element.id == id);
    selectProduct.id = id;
    selectProduct.title = title;
    selectProduct.description = description;
    selectProduct.category = category;
    selectProduct.image = image;
    selectProduct.price = price;
    selectProduct.rating = rating;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil diubah'),
        duration: Duration(seconds: 1),
      ),
    );
    notifyListeners();
  }

  void deleteProduct(String id, BuildContext context) {
    _allProduct.removeWhere((element) => element.id == id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil dihapus'),
        duration: Duration(seconds: 1),
      ),
    );
    notifyListeners();
  }
}
